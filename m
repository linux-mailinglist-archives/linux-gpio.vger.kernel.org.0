Return-Path: <linux-gpio+bounces-28744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214BC6E259
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D2FFE2DC8B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 11:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCF634AAF7;
	Wed, 19 Nov 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DMluhrfp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3795921B91D
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550485; cv=none; b=oavhHxribkSL4XuzrdXyKNwNpkN9DqoqpIwP6p1Oyp4O6CY3cvtf1GscZtBLhr13L7ErhrvRRy7jQXmor+HyaTOBWe+na/1Jo6Ex4vT/BKKBBBtGN+tn46PWX+w6ge14SJNLX0aH5j2L/cCiq3nnNcfEy+u+pyLpf7o+FsY5WhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550485; c=relaxed/simple;
	bh=oIVxbrisoLo5iDMUDa+xjmzIhUzB8la4EWGOC+bo1qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TMBHwA+mVkDubioNT5J177D8A4IyRxfTpn3idaMHDPGCWbBjdEj5TGNmxx9VxBPgSwR7EEk8g11Y0y4PoFPOtnkcLIy8gJbl0o+Oyk32GG5K9W2m8A6aBXshUfg4gFL0U/eYwwhgsehTspASKbDddrNA0S/lkwaZe9/Gx07XuBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DMluhrfp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso34453145e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763550482; x=1764155282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nsm74sKvrsBWwA3IByPnPXltGNe2AsVyeAvijDWzmQ=;
        b=DMluhrfp92tf87GIXsGXiGJGTojFKBKQfpPXSDKwDhPeFabO0oneRX7Jdzte8jlddY
         Cow148zCZdSCOsRsLSSRYA6VfyBdWQtgHXRsDGqZAUnqItuiMrKntoLRIuL4oB44FgIS
         hoEfBouL+Iq6Un9UXRM7NrIi7GXMCMp/UMNkM4TOTMNbgCt6NK9WkkK8HdcNVXID9ElR
         iWtDM9JuFrzDRFdstrUH6MtVf5V4iYawg3xBvM+pxh22/2VYfN2R8wceNAEoxFsNg+Eb
         2s7xG19jJdGnOzPEk7bv7xO0MNg99HBCkvZ2goosGIaxzAskDrnOk7AXM7jSvCq9dlSi
         oKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550482; x=1764155282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nsm74sKvrsBWwA3IByPnPXltGNe2AsVyeAvijDWzmQ=;
        b=F/ob6hUSYgB68jdJQY8prJv6XVDrWR8DM+FKyzPaMglzOPAJ+MEkuyem/35ELDps+8
         Wbvr7TUffOA+PjDJcKHXzeBzezxx/IvUwcTATf1RpsF1X/R9tf9o8BzjqbvulqcblZU8
         8hRCjrJJNV1mpISMGHgUTQ1y2ulJfEd54P5UJoqLC1RffrQqtZwiZlbWQGAeck+rDemT
         qMr4/CIG39DnHP9T1CmrwY07XyENmY5FbP37ce/aEPr82TWiLLQNBvGSTbrQyMM0/WkP
         7r1mYVtnnMOPDdTK0fXX+1NoO8ofYAs1GBKxC+sfJUlhzaefSNWe8UsZ+bV2xxl6h7A9
         23bw==
X-Forwarded-Encrypted: i=1; AJvYcCVH64IfOYAnGjG50o6wHjSA9hXnoZ50tsGmK4prGmTgd36fduM/RPgTYigWLGN16swPPu9Jik0N14GU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/7Y0uARG7EUmJXyFxxD3WsKWelaujBODe3Wiht+IaD5c/T0oA
	m5GgRC8EMpvNGQtuW18vj9TRtIWDSLVfzMzieV2D8hPIiirbCaJt7brUtYSRkVDw0UE=
X-Gm-Gg: ASbGncvZlzq5e8/arHBhPZZLhLvcIcicILkgJkuK+OzAWgp4755Tt1s+hckYL3QOut6
	Zxh6R5AQeiiydHZJs21cc/LxjinyH9IhTIVrYg8dYbjzWYHTFWSyAVtvdq9E2KDJcTjZkiUSIoo
	meWJCCdRNJlzXE8FrnDlIxipPnyMSNRFZrAnm1/ejy99+/gpzWvNj8VELY9zUh28xSawavF8L/N
	fod2+85nog7N5Zou8U0bvQOGDfBX57Ic4H4852EGB705QaQ2tgg4sk9rw+Z4+5YgrWAslEJiIAy
	qko8QVwa9ThJgP735vxoOFnOj/Ko9/pVj/WKcSMcCjqBrd2f8Qu39yKB7vngIROmmZ8vDsLo4zV
	R1SNkFD0YE1DpqfsxG/fvRMuOdY5gjqU3zQIduYToypScaASZTSsrpdwb9A7rahsgflnbytQqf9
	K3Q8265yn4RgFj0HFPFlsbX0DnVUY=
X-Google-Smtp-Source: AGHT+IG8Wojb2HHUAV2dMdUaxEd77B7e9eazR3QULfNiB1mXqErl2PdZSu8eRBd2Qr8FuXPpA2rKfg==
X-Received: by 2002:a05:600c:524b:b0:477:af07:dd21 with SMTP id 5b1f17b1804b1-477af07dec3mr43024145e9.25.1763550482482;
        Wed, 19 Nov 2025 03:08:02 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1035c78sm41765265e9.11.2025.11.19.03.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:08:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and feature list for PCA953x
Date: Wed, 19 Nov 2025 12:08:00 +0100
Message-ID: <176355047774.64410.17146570177495488850.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Nov 2025 23:48:20 +0100, Andy Shevchenko wrote:
> I went through all the datasheets and created this note listing
> chip functions and register layouts.
> 
> 

Applied, thanks!

[1/1] Documentation: gpio: Add a compatibility and feature list for PCA953x
      https://git.kernel.org/brgl/linux/c/5ef5f3c2245e13c62adf4cb0980cdd7bd72c59d0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

