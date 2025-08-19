Return-Path: <linux-gpio+bounces-24531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 131EEB2BDA2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C30DC6845FD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 09:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0077D315771;
	Tue, 19 Aug 2025 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TV1701H6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21090311958
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596432; cv=none; b=MoHe8C6HcHLzd0uqHQWG3aPkgZbbOjGavHHH+aqhfqRswUwff3Ofnc5ucNzBR2DBqTspCHITUULEebkFwbkEt1dmwcBkOTAwuLWDD4AMNgixMy41porSZ7kdpPy0IhCTJ9bIqini2lf7UCYQazDbtbIpsnPkncxrc6k8L1CQI64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596432; c=relaxed/simple;
	bh=VcY+ozx/Ho8BSaQMSmHaUt6rvOLcj2GcvzaqH8cYyb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aa8MRPc9lAB7hA8Jp/58HPKVadehy/orTZpZjxy32UJwkhtTHKVvuolfeBlLoUwUgoHOnusHdhTFtsH18gHzzyYqTQwF8B2H794GiA0K9l0aUsYLyFA6/9owHDO3+Px/038RzRD3V8px2kL2VPozEzylYRzvP9jFwNxiVUhw5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TV1701H6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so38136925e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596429; x=1756201229; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JC1qoqm5FQ+WfQG42oD/26bliL3qAiAIH8pHZErFreE=;
        b=TV1701H6a1n7CcF+4UlLZegEo8WDZDus648uxk+X+C2c2lWFglEX2Mi9EnMbKHdC/y
         ZCY3b93XnVnv9rSVpPmwUTZvblknI5Y66TLQ3WJy/YCSNDMG7L6zzgWwgOACgBttjgAP
         Ni0Pit66LQFCylNFHdBth7FFs/aiWV5H7yksAPgExDAVsRT+ROIfe4o5tsWFRHCLmO+j
         3TcwWDqvc6JF6ihInBXaYWWXcWrMqY2IsIAYIVjcmk3YGPX4EryXKjI00TG+FlU+PatJ
         zz//JY3dNnHxiaRJtHVSblYo4YCKp0fn9fJuOJ+YZuFQOXkA2Gtamq2/R6Ox53RtCdN1
         Q3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596429; x=1756201229;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JC1qoqm5FQ+WfQG42oD/26bliL3qAiAIH8pHZErFreE=;
        b=HkHEleKFU+RrUXFHi2Tqs1oDROwxPSQtwpPboOXMCS4DCIcXWcjw77eL7xiI6MV/vR
         5bx+S6TMeYSJDEu1478b1jfQq27CrFcldTk+C/lWlJ4QM15mIvGsp1uPGhc3qeU1Vv/V
         n2OI5yvMyU0n8E4k+sEnOEyxahl2wxzE+BBNDPGn5vZuWH9dyc0LPmVS10JvxJHWr8LK
         Jj3oWqj6tqNBhNhwvekchg61hkYx5zmwIW4fRpAk4HhmHPckucA6l16JxwWtSYoJhFGC
         r/DIZdS+l3xd6uKH2XUEjbe0ROkMDnUkNK6py/P8r7Q1UopN/z9g98fI72SUIdgWPJnt
         ncSg==
X-Gm-Message-State: AOJu0YyCkjW1jB74jl3ixGd0wy0CcecxKVmal512FrhRnhAewa1ZMsTl
	nEuufh1TJZaHtr9VS06Oh+WBPXZ1KtuhH8f/C8Q+y4cA8yoV29hdXDAdf3fKZiEkW8Q=
X-Gm-Gg: ASbGncuxQSX4DwAwRCItyJgOrPPkEZwcxMnII6nGmUjOvpBYzc/UQEJthZIBHx1J68f
	Zp4E0PhOesBcNlue/IeHO3y+9ZOziCqZM+VCa0IFhytBqufS3UdVaO1t/AXG8B1WeNj7sg/Cyhc
	897pi64AWBzjJTlB/85y4cTwxYJ58jTcpdkhvCWQ2t00W7MP2JcfF+pomrExTn6RKUuq13UKyed
	Mt9o6JThI8cVxthpebk1ow6bVnlttJmzx3eMNrAzReLLRIt9ShuwoxqKNMlHt5DS4tQ7DDu+hqE
	24Av30beS+z1Vn8N+YfE0SlspE2NDFnhJn2Pu0ur7AEUCVVLzQJOIvUU2sXn0SmaVc+G5y13LrK
	DcvmAK3EIOMCoqrTPMamA7QJ/Zr97YunFfztXeQ==
X-Google-Smtp-Source: AGHT+IHugMBUCFvIoO2BOSzD+MnQmvApVJ5h+aGU/FxuiFEf5ooOeRefbkoNeb8WOpoQlKfl0cQmRg==
X-Received: by 2002:a05:6000:4305:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3c0e38f2456mr1462006f8f.26.1755596429129;
        Tue, 19 Aug 2025 02:40:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077c57d32sm3012839f8f.64.2025.08.19.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:40:28 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:40:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yulin Lu <luyulin@eswincomputing.com>
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: eswin: Add EIC7700 pinctrl driver
Message-ID: <aKRGiZ-fai0bv0tG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Yulin Lu,

Commit 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
from Jun 12, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/pinctrl/pinctrl-eic7700.c:638 eic7700_pinctrl_probe()
	warn: passing zero to 'PTR_ERR'

drivers/pinctrl/pinctrl-eic7700.c
    619 static int eic7700_pinctrl_probe(struct platform_device *pdev)
    620 {
    621         struct device *dev = &pdev->dev;
    622         struct pinctrl_dev *pctldev;
    623         struct eic7700_pinctrl *pc;
    624         struct regulator *regulator;
    625         u32 rgmii0_mode, rgmii1_mode;
    626         int ret, voltage;
    627 
    628         pc = devm_kzalloc(dev, struct_size(pc, functions, EIC7700_FUNCTIONS_COUNT), GFP_KERNEL);
    629         if (!pc)
    630                 return -ENOMEM;
    631 
    632         pc->base = devm_platform_ioremap_resource(pdev, 0);
    633         if (IS_ERR(pc->base))
    634                 return PTR_ERR(pc->base);
    635 
    636         regulator = devm_regulator_get(dev, "vrgmii");
    637         if (IS_ERR_OR_NULL(regulator)) {
--> 638                 return dev_err_probe(dev, PTR_ERR(regulator),

devm_regulator_get() will return NULL if CONFIG_REGULATOR is disabled.
PTR_ERR(NULL) is success.

    639                                          "failed to get vrgmii regulator\n");
    640         }
    641 
    642         voltage = regulator_get_voltage(regulator);
    643         if (voltage < 0) {
    644                 return dev_err_probe(&pdev->dev, voltage,
    645                          "Failed to get voltage from regulator\n");

If CONFIG_REGULATOR is disabled then this will return negative.  So this
driver can't work without a regulator.  Ideally the KConfig would enforce
that so we don't build drivers which can't work.

In that case the if (IS_ERR_OR_NULL()) check should be changed to
if (IS_ERR()) {.  See my blog for more details:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

    646         }
    647 
    648         rgmii0_mode = readl_relaxed(pc->base + EIC7700_RGMII0_SEL_MODE);

regards,
dan carpenter

