Return-Path: <linux-gpio+bounces-27352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B21D5BF5658
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DCEE4FCBAB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8D732B9A2;
	Tue, 21 Oct 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N6cR1szu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD832A3FE
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037314; cv=none; b=PdxXQpjjkOEa3OxC3V9fcqMItGVuLNF6chxO1SVbaFMqyXTflKm1odL/JYjpm38Oc3LHhIdY7tGGkdBBPt0CqStvBMsY5qxBIxVUnakD0bpW6j5ca86AfjHsrtkx1qxgBIaxRh1gdRLYxxuEjXrTFoernNmuRLrZp3ZT6WEx2EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037314; c=relaxed/simple;
	bh=6FGMoBORg99KnBrarD8GoS8zAVIGXZsSV3BubyDkhDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKe1S9akLISNAeHJ760uBNdQrmDEQ3/c2AMjPe9vkxHKVmwWpSVzAuwkNEYzAaEVOegC5MfaOm6jvxuHDtRVb2AUOp+OUSklXuBVq+YCE0uV1h4s+8IaIbIwf+SfSuN/ZkoqXCDbQMal+msHbosi1zEanliD6ALZvjOa1IyG2OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N6cR1szu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710683a644so47129945e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761037310; x=1761642110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49JxCosN6UMd+mu602+9mIL8zSuLvHdexepIGtQqYnU=;
        b=N6cR1szumcd0F7oAFEndX5X4NRVVCSLcsZtmEF/eOwquswLMxVA7xmyrPpKTanEF70
         GfUqEBdWOSqRRtzIQnzxi3rpyYWhGfvK3CClKDYvr/ylZzwX33bme7xCkM0L5KvYoqKr
         QOd+I2G8cIONIYU8d3R1mpgSAvBx0cvhyzhX5fd2EntaPLG4QhGf1F/hw8mO+h4USD08
         X3OvNnWaSMcS/S+kxglqaax73Rn7X0AVi9bFVasJpMHHcFlKiz0RJT5/32y0eqjyc6cS
         nRJ62Tq/OinpxVTGa/inarf3ku2K8FpRVx5E2/QGPHZ6Cih2mxq4J+Idlzgz6HNv03b+
         Iz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037310; x=1761642110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49JxCosN6UMd+mu602+9mIL8zSuLvHdexepIGtQqYnU=;
        b=SB/uex+UHmrpoBpmuwV+LCa6nWyB6XeGVIomY3IFZSYbZ+0VDuqajlslQeA1NU0gZ8
         o8bRltGw+BZAgNyRcjSDTWo8HxrlJvoudOmREnh26RAq7DP8ow+xbl2MO2F8zgz9Hi8b
         /lamMbgJjCdVC1Z7cgp6ESRIcqb8EUm17v+vuCfzFTI3aN62REF7PjV2JMdfUYr4cPqb
         oebZ8iut4IBjWB7nzvXdOBB5vxiwmobeIJepNFGPC978t1pM2wH3UxiA/p8EGXyEHQk2
         7amfH1wtnUydlArTSAXFvHnzLD4tOMVFf0fPHW5y0Jd8oMo55ewl7Ci750e0ymB4uO0K
         7RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx58Y2sTv4Zg5AKO5fg4UN9Omv4HSxd7SG81GaRvO5OH7xB/kfumi+vh3cat30+YesvWviv7TnhREB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2F0Nm0gydPYbLuEDrp6QcMduZGTcpNee+wk6+Z2honYJm3M1/
	05pYgXNQ51v75+QUZGMvP7jT5NDVXsZ7IcGP8GiUeUcETYPmEHJYO09zuxqrM37q2Bk=
X-Gm-Gg: ASbGnctF6iSQ19OTpkzTmYyE647S3kfguBYDg3YoiE0m1ZPBxiwPjX8EgZZSvYmVY17
	++f1+nnPxHB5aZmlW8N8vFK3dAlUlTKKk4iMMHWPB2/ofAAZmbUj4SoFb9Ut+DUqeSE4cxx3l7t
	fnbLSBXhDkEH7UvZc+PAsVo59UwaLweqUcWvTKJz9Y+cTeiKlvqRJRzfU70BmwJld58o3s+PUhv
	pxnKFEPpyNlSknr7h9NdeC4+eWKkpW8cIe6hXJz2uXHb6J6kzIG70ALQb6kVuWGA0SQXT4ra+qO
	6n/mia1mm8ORlBHirAZZMZKcQHx/vGXo+LhY3y8N/wLqFJBn3X5l7QycOmuw/VoLIqqxA3P5qgc
	gdAtqRS5VilLpBAcnl7iRr953HacGYUuXRMXfroT3vOrC5+PuXGM7hJcagfM719/l2m/Y+UzTnJ
	uYVQ==
X-Google-Smtp-Source: AGHT+IF4+Jqg42h4vf4LdcJ3ZdiKv/gkignL2tLnHJsLuKCIADz3i+gKe0h9ZTIsqthfXRn+rzdJQA==
X-Received: by 2002:a05:600c:4483:b0:46e:33ed:bca4 with SMTP id 5b1f17b1804b1-47109b58b72mr87717475e9.15.1761037310064;
        Tue, 21 Oct 2025 02:01:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2979:9ff9:6677:97c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d972sm191369065e9.1.2025.10.21.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:01:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Michael Walle <mwalle@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] gpio: qixis-fpga: add missing module description
Date: Tue, 21 Oct 2025 11:01:44 +0200
Message-ID: <176103730244.11215.5092820773554833275.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020072028.21423-1-brgl@bgdev.pl>
References: <20251020072028.21423-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 20 Oct 2025 09:20:28 +0200, Bartosz Golaszewski wrote:
> A kernel module must have a license and should have a description. Add
> missing MODULE_LICENSE(), MODULE_DESCRIPTION() and throw in a
> MODULE_AUTHOR() for good measure.
> 
> This fixes the following build issues:
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-qixis-fpga.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-qixis-fpga.o
> 
> [...]

Applied, thanks!

[1/1] gpio: qixis-fpga: add missing module description
      https://git.kernel.org/brgl/linux/c/e0a6ec724e5b87a0b162912b5d30bb6f066677e2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

