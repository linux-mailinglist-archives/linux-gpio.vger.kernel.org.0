Return-Path: <linux-gpio+bounces-20033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1DDAB5362
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E042866DCD
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A9728C2D9;
	Tue, 13 May 2025 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kU9tSSJC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3723C8B3
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134149; cv=none; b=ecuUuehAxa+nro6V1gRXr2kOpvgZYFkQT9tWf3a6yv+piIApkcKVP2ntwAWqwEBHImO/fMpq8N4g4Pra0FE5bhlkXb6hicFWw2LzSU+J4h2OODs0YRFbVuLsqBxV5xAFRc4Z76F66PM8k2NFCnSNSlvse+QkUWe2qscCedWd2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134149; c=relaxed/simple;
	bh=7C7FBJUy24pQwhj2ko07VwT/gjAy69DojfL+YvpqFQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpLi2tQEWj/3QzngLJdsMIF+tYmm8lQADwIQNJndhWr3VgdHoBqU1uuoeM5enLspT1LNXYte1V3KPPHT4Dd0tfvzcSlzuL4SwUGsDHjRYu121xzYHM6Gl4dOhRiH1fHiB9aRHbxXkKEtPmtj4MU+3qyV83hVD4mzAZb665gkSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kU9tSSJC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe574976so39405195e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 04:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747134145; x=1747738945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIuQRYwFH70ryKEjus/+ycj00Kxpege6lANQjndQh/I=;
        b=kU9tSSJCDzPt31hjYnEV1dE7WlPnVyEPUVhZKleyyeAb4euJ0cMr51AG4A1qxm4bCR
         rFaGFML1ExSQ334c3qVEIVYL16NamxDb72K7OvHEFx2r/MqHR3YcrTb4+vTnRowKPG4L
         3Tq0hE6JV02Vcv4eRGWO1kobxgnVeZcWqb06mgiN7oGL7DIq7QfNUX+5jKpbsTRm9cPg
         XNPh3Ch2UtRL1WLw2XMBXHjhGF/IAyPHVWNmey/PD1tDKzkC4qKwGZI+JpgkjKUqncW2
         7QjeaMQyn5xgXiMz+6N3O43nz9yDcNCE8SBOz7/alcfKFE7T7tk5sgfDtQQ8u9ETv1Na
         3bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134145; x=1747738945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIuQRYwFH70ryKEjus/+ycj00Kxpege6lANQjndQh/I=;
        b=cHQ/C5j/dJ9RuInM1edYF1j1OBCSnJFMn+QfQA2WW02nyNs/70beWcrmnyOl8nVZdu
         lXbbLUyf3KbQyg36nCLYM+9jG7muDgx5qJJgulER8cJMhv08FKpDRfpmZmI9yb8aIAtG
         f73HlopXq6C6XDq2tCVEyjtudJTlMlzzZUalvrSPXnmw2Adc8rskYMdqfpkJEqByRAiB
         5peLiyh/clLGuXR94/kVWdpTN4VzduRXUqbOCSXCugDGxvj6Fq6USxSKofF8zroXP5QQ
         SvuinTOsQLhASpcOLNaSa9OPPLb325QuUjWWQRrb06daQxw+aQsefFdsr90Goe79BP8K
         Fz2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQnZFzLXBLWpUKjcyIlf9WXxt6/qRDVgeUWrLbgfETlfp2ZB0bal8Ezh6hR2+pE7kSIPhR/ftBnwMK@vger.kernel.org
X-Gm-Message-State: AOJu0YwecHSyLjIs1ndbB84HElpJCpbgEK1mC2PxBdU5cNKNrd3Bsm4T
	Nrt8CZJPbPxn0zY7Vm+RYhDp/j015PlEWRFT8Biiz05T6LEykKbT5QbTFAVFcN8=
X-Gm-Gg: ASbGncsSszVW1FPJQSjQsk3db31p9SfJRkqJi3X4bbagS7ArAHWgAD1rilGWnxTH8go
	w3+CSK9FuRin05aDFFUC4HUt8nIpguQ4fX9WcFNt3vLZSu0ScFwM+3s5daCmsy1xqrtY/dsQy5K
	6U8JCUpk9a3Tvb/MMfFAf2uIB+F/yh80Bdg1hppHJOiQWWDadtEA0FSU1524/ILhnMcHdVG2PXi
	7xOSAf3cBTKgYcs2NqwCF/03DtbEu5dT0RE6a+Uhki6d+4LjN4L/IZDd18Yfk1SarKEl+hDol4B
	kiPnURH/K8invv8c2jXm9KrAW9opasohfvUBrPO1H6iHdEt6XZn8doYg6Br4eaUPY3Yi3/BKm3r
	dh9Ctu1tlo8PQ1njbN8uGnY3R
X-Google-Smtp-Source: AGHT+IEzayTDLNTwYtqIT+B5aLrYmeyR5WNydDtXjj4rAfErOhIW1EDdBLfpwZ9AflrAt4ElBdrCuw==
X-Received: by 2002:a05:600c:8212:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-442d6de0e29mr170363815e9.31.1747134145222;
        Tue, 13 May 2025 04:02:25 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca47sm15851252f8f.73.2025.05.13.04.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:02:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	Markus Burri <markus.burri@mt.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] gpio: fix potential out-of-bound write
Date: Tue, 13 May 2025 13:02:19 +0200
Message-ID: <174713408244.11101.2931169841658120912.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509150459.115489-1-markus.burri@mt.com>
References: <20250509150459.115489-1-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 09 May 2025 17:04:59 +0200, Markus Burri wrote:
> Check that the input size does not exceed the buffer size.
> If a caller write more characters, count is truncated to the max available
> space in "simple_write_to_buffer".
> Write a zero termination afterwards.
> 
> 

I tweaked the subject line: should have been: "gpio: virtuser: ...".

Also: you sent it as v1 but it was in fact v2, please keep the series
numbering even when splitting patches out of a bigger one.

[1/1] gpio: fix potential out-of-bound write
      https://git.kernel.org/brgl/linux/c/7118be7c6072f40391923543fdd1563b8d56377c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

