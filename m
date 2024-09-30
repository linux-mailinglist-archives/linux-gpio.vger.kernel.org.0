Return-Path: <linux-gpio+bounces-10551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FAC989CAE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 10:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53FB7280F9E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 08:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA09E17BB35;
	Mon, 30 Sep 2024 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uZ722uia"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ABF178383
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684563; cv=none; b=N2/NqG/NmbL+MyUS6YKhyoerjFVTneuOw8s3jMj/FIwXXyhMfJRPQHfrp9ykC3JNya+FY7FoWmd6vsQiNsmCzcwyL+L3dIXCy++bhEipSV55jq+ejO137SVbWCnKsWmhLt3NtZUnyspeUPo0FsJG2TKUehAFnjdzrV/PGe0FTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684563; c=relaxed/simple;
	bh=kInzHu+DZMjySF5HgJl3aVLaJWgqnDiy6OGoBldmmtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqPLwBbbaaazNYhFTfI5ZfqhJb3UtnIi6rtnOrk2RlXeGrbWVmJ6vdQfhVbjeLZss/RzidD6FmOwCvnF9bMnJ7Kkxpl3CgGr6d3P/+FrRl3wWqbz+b0gPIV47gkpTiCQGDz+CRJX+AEJDzrZ67V6AYsTtTyLgt9Fqyk6qGsmD0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uZ722uia; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so36016355e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727684560; x=1728289360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXLuuCMARrDSkoYE10IWmIDKxlbdBGWD5/DEfplZmu0=;
        b=uZ722uiaxFCMW2Wb3wS49lGPJxrHwb3PAS8NzmtpMvdcgzZAibHzmwX9dioSeI4b5d
         7by1gOGs4eCFLRBAsf5BThDrIY6n+v6tp334JcyygtomcLCLlhXoyoujX1xfEhbjskp8
         f5vhdzIxUBFYjX9YzLZSX14g1Sx8XISF7OZxzoqyvp2ZY2lyhBrxAdEB2+cQJ4ycHCe2
         oFM3TIMDMIxnZBKIwCxswEgulob+NmQQdF/nDfR8k7kz1gWx4+xRSCqNn9qlNUB/qWeH
         bH3j3dnpqHsclVGfB6iLJ6WMdZkxBig87lKvIvHgSXZZF/MY/tbaPyHHDqFnZUHcp7MB
         TItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684560; x=1728289360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXLuuCMARrDSkoYE10IWmIDKxlbdBGWD5/DEfplZmu0=;
        b=SmZK1NG3+c4/CUfJi0x+GykQyehJ80afdpGQOXIWJmybWPJlx9mS10WICKNi+vjo0E
         B/8Mom8TcYIuWCbB3dcflbxjBlAiIAwIaCDu+qoNONTkEYf20AUHvAi0cbnqfrFyCl4a
         6q8dC+FCKPsIdwdy56xBue8Kv/oemE3lnUDBs7I9ApyJnWzsRN8vi8Wlb/Xc4jMbbzMS
         DCHPjXVj3cCFPvBrX9bl5EW0zrlatUc4elwz1m8SDO01B15AKTump7y/hw1ZrcwR1Qtj
         PNH4az6vLkQkT4cFHAQ7+fx28z+H6PUIkz4eL00qaru29yaeUvzJlwYBrOZVEeu4EXMC
         J0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWt9zFaileIH5fi29TUUDdVt/8fyN4lb1yOpMudOpa7kPMS5LjXBSoMsrOUkf+qU+erWKSNDUtc6ba@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/h72+fdxOSq+NOdsh7X/m82Z8T7RpSmIfG4k1G1oOZUioqw69
	4xtJsKIj0pXB1vSKG7Ku8ThtTWI8OPsSdP1weppGlHlmAOFFLCHAxyYp8w88DBo=
X-Google-Smtp-Source: AGHT+IEtSCEZEaoTjTbTuLSoNZbqIclxjd8L29K4RDx2V5kMcHLRnI5c7hDIQrELSjeStwElv3JSLQ==
X-Received: by 2002:adf:eac9:0:b0:374:c8e5:d568 with SMTP id ffacd0b85a97d-37cd5aa9974mr6999793f8f.29.1727684560337;
        Mon, 30 Sep 2024 01:22:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm8522655f8f.3.2024.09.30.01.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 01:22:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: cdev: Fix reference to linereq_set_config_unlocked()
Date: Mon, 30 Sep 2024 10:22:32 +0200
Message-ID: <172768450502.13259.13167820347388112878.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924155624.230130-1-warthog618@gmail.com>
References: <20240924155624.230130-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 24 Sep 2024 23:56:24 +0800, Kent Gibson wrote:
> With the change to cleanup.h guards, linereq_set_config_unlocked() was
> collapsed into linereq_set_config(), but documentation referencing it
> was not updated to reflect that change.
> 
> Update the reference to linereq_set_config().
> 
> 
> [...]

Applied, thanks!

[1/1] gpiolib: cdev: Fix reference to linereq_set_config_unlocked()
      commit: f522f396ab801ecaec132948b3766fea3a41359f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

