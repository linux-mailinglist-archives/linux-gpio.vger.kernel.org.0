Return-Path: <linux-gpio+bounces-9533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25169968384
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886F3281186
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 09:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD5D185B4D;
	Mon,  2 Sep 2024 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OjOKgu2W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836A44C76
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270400; cv=none; b=fX+72gTWdNl55uS1rCHAXQDTk2tLzXR4hTEM3XGovvZcLPBr8VbOB6fIisbrBeZrGfHDqk/IlMRmvv0G+NKwh8fV+V4WLURDO5lz5Iv4Uq22NvP0o374tAVq0qgyzWmbxAaBlbHJX87oIEiY3G2czecK0p/0rGvGZLniI5xiicE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270400; c=relaxed/simple;
	bh=mxXOMvXAWzIqlWZH+wOhuCEAYYQ2ycQl61aOIdkm/Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S2JT51cocYXMVvSc8zGp/t7kOjjJM0akEqP7hoG4vkGL1uoxIXR011zqoRliHsRGb76m8i4Ru+zL6+HuQRRRwtdxGGueVtkSJilnyN3sFT+Cc0Cw0PSljFqvoyelOWVIYFwqVGXYdn9P6YIczPHEBBtxa7ySoimStRhoDBXeF7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OjOKgu2W; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c2561e8041so1113673a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 02:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270397; x=1725875197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvU0q4IqsZC3m7HbUXvgFdJn7OUlluR4GbPu5ha70so=;
        b=OjOKgu2W/cu1/0U3nL/dxblFCa2ZIGQNVfmSRDlNFJJXhu2VHfOX+VA1pOHYwdo8T/
         ARGPks+fwOtmacTbFAqWr2CLe0p/LE0pe8y+sObPjkMJBo0lFJFB8arwGNzf0e+33xUS
         8Mv0eihhP9pxQLETQppdAv9ioDG4yRZzBleiz0MjtyC+YK8lSUWReqgBmay3ZfjsOym0
         nAX6zryt2vNgnAzvmYgj+iRXoLHD+FHOx52IzyLEcbOzTizOjexIyrN8zfVgiJzv/Efd
         m/RG+thlQfmRVqtHAf/Kl2SYSNVKDKZQnaIhLrNklkbZKhOeR9W9v0Fa8U6kE3i+B5Yp
         lZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270397; x=1725875197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvU0q4IqsZC3m7HbUXvgFdJn7OUlluR4GbPu5ha70so=;
        b=WFRiOWBJLB10i4D+X5th4uGoBp6M94CP170uYyT4l+n4LsBmcbTeu6d1ZzNOWo+b1g
         tJMwlALpTLr4jCwO5LMYrnweeaiOBI5LpWvWe255cUoyFqMahHYIDn9RVYvF52thQmWd
         D5rXGJ3EouLSY7Ku2oDHJzi1OBdYFfGJvdZZwU4wKADkib9WpBA8gFRPqiuvaxVKP2gE
         Zf9RD8dZZyDIug/VflR3YbpEkzZsRmgRSX1Tp4N6Td4d0KFUxdxy20WZmCtvfWRkYHzo
         9V6u2eQ+mAbXe23qtfQGIPJd3pyvPPbGtQ4UVj/qHpKjLXeqnLrC83K0Eq+NX5z2XQFX
         PsPg==
X-Forwarded-Encrypted: i=1; AJvYcCUEqFoIf75hsInOTpqNnaCvCWWwfHbKa7gxzats6xMNzsiUHk/lM7s8MHLZNR3KVv9R8GdDzVt6bVbG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7UA9pyFM+bJyivPCRoyaxkn6KQyghFBGKdEuDy5Xmy11MygRH
	IJWvgMDHi6thHVrUirppUjfzNqXQWgr28fKn+Hn+ChZ9sHCRUXnqdTUgV+tIY68=
X-Google-Smtp-Source: AGHT+IH1zg1jlwXDCyd/ampfGvI2tFOVMbwlFkIFwwhxA5YtvJe4GT6oAvCh2TQyWSsKQ+egPE4Erg==
X-Received: by 2002:a05:6402:3481:b0:5c2:112e:f106 with SMTP id 4fb4d7f45d1cf-5c21ed319c6mr9363383a12.3.1725270396001;
        Mon, 02 Sep 2024 02:46:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccfeacsm5009357a12.78.2024.09.02.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:46:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	Shen Lichuan <shenlichuan@vivo.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] gpio: stmpe: Simplify with dev_err_probe()
Date: Mon,  2 Sep 2024 11:46:34 +0200
Message-ID: <172527039219.21144.385699965145763717.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829131051.43200-1-shenlichuan@vivo.com>
References: <20240829131051.43200-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 29 Aug 2024 21:10:51 +0800, Shen Lichuan wrote:
> Use dev_err_probe() to simplify the error path and unify a message
> template.
> 
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
> 
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
> 
> [...]

Applied, thanks!

[1/1] gpio: stmpe: Simplify with dev_err_probe()
      commit: 1882e769362b8e4ef68fd30a05295f5eedf5c54a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

