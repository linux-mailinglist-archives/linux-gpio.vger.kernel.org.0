Return-Path: <linux-gpio+bounces-4170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0348737B9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 14:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70A931C21B27
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 13:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7741D130AEE;
	Wed,  6 Mar 2024 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5qWhSMk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4651BDD3
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709731731; cv=none; b=eLX3y8m57leKtYnczqHzSWLLksN2gzMxZS5P/Yjh5CgeVlap6espMyyLeqabturBBMiBzBWJ/A/uoFVQ2zZ4GzZ6fTV4qMBNTHDo6b/2mMXCAxZvc9pr53LAfntSSZtptAa1Byydtfry9jqOPi0DqwZjrN7vU4NhfMwEKbYpWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709731731; c=relaxed/simple;
	bh=OrjFciEgPoiDtAlwGxwXG8sb4TXqk3WJU/1lUh/nqRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t/oYvVYxye0LsZsR1GE6nAv2muVQFHdKO1oRs8R/7QkxpmLMsqCHaYclbspy8TZcYAFw7281OOXlH1GXm7AxXftXv2Lcx9s8IUXvu/d0wyrNgenK2ayWumzjup/2dtk783lcp4srxr71xFZc2okH5f6DrBMM4uwwnH2AimIQcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5qWhSMk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e1878e357so602996f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 05:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709731728; x=1710336528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9W+DTc1gBu+fa1Ts7s8hZNpaIVMonPw2fIrPTG6GOjs=;
        b=e5qWhSMkMGCm4T864VYOc1XOA+5x3ue8kvTaigi6XiDtemdSiqAwHJrf3HPOATMxLh
         CrOXRcc/0rtVTggoRHrulP/bdmGuC9p7H7qKYy4ucflYT57au3ubr+otufqEKDM/Rs5g
         mGd9r6/uGpvnDFYjkYdPx5uL0CpTHTfvFH92fS9AyjhXkTMxRARONVWFWoSGe8lefTTL
         cxV5wJ+XvZ2yr6cb808Rwyapf5M3JKbhAF92A7bBJFoujGbpgQGSNVsZoTlF57RF2Vud
         CkYnVj0dHWS/NUy1rpvnZeW8XumunVI7qKzENY+G/g4JMRJH8cSgO8yge+2IXDp1V9xV
         v30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731728; x=1710336528;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9W+DTc1gBu+fa1Ts7s8hZNpaIVMonPw2fIrPTG6GOjs=;
        b=CCcoSG2iSsuYLsNBjtvCuHaxwS+Qh7Ea+NwIUhlj0MICom5/aLAdXoLRNcABefYjOT
         D9o4FCo+YHM6TBx4HK9O47cbN4sMey5rmH1Z4msmM+9H6/98I7xmfmW45/ncYxShNG1h
         I34hdeaZrAOMguGwntG3PRGOpM7aT1MGPKBkb/IlYzcAVnfVavAPmiUEy1297oTejm7W
         3keg+Y/a817VuXzyMT28UuZWbx+4zUof3L/ip2VqeD+Juggfh7Vtxl3BcQVUOGY1senK
         ++kUrkmiMFhoCKXBT3SrsmUx7D4xlLHv3o71+QqUDnrMD8VIrPdRQR1KsfbC2sr7xYbp
         sn4w==
X-Gm-Message-State: AOJu0YxiYqu7ZfldPfn68cH7zsaaqbJXvE7/FL3SgbRbppKw6L2xPElG
	z/V3/CSTjefIvixSfOsQk8fm5hYMBKoxbrKUXdd7BqSK6KntHBm+LcqSalRu+go=
X-Google-Smtp-Source: AGHT+IHXvS/Yad38z/wzLjL/BaHpBjt40v1xg3fqqJuJtENcEMg/p0pvbJmE3w3bMcKFfGqRT5lNKA==
X-Received: by 2002:a5d:5443:0:b0:33d:f46f:6384 with SMTP id w3-20020a5d5443000000b0033df46f6384mr10659099wrv.23.1709731727548;
        Wed, 06 Mar 2024 05:28:47 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f15-20020adffccf000000b0033dedd63382sm17645169wrs.101.2024.03.06.05.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 05:28:47 -0800 (PST)
Date: Wed, 6 Mar 2024 16:28:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: theo.lebrun@bootlin.com
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] gpio: nomadik: support mobileye,eyeq5-gpio
Message-ID: <5ee722f8-7582-420d-8477-45be6acde90f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Théo Lebrun,

Commit 3c30cc26df0a ("gpio: nomadik: support mobileye,eyeq5-gpio")
from Feb 28, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/pinctrl/nomadik/pinctrl-nomadik.c:1233 nmk_pinctrl_probe()
	error: 'nmk_chip' dereferencing possible ERR_PTR()

drivers/pinctrl/nomadik/pinctrl-nomadik.c
    1211         /*
    1212          * Since we depend on the GPIO chips to provide clock and register base
    1213          * for the pin control operations, make sure that we have these
    1214          * populated before we continue. Follow the phandles to instantiate
    1215          * them. The GPIO portion of the actual hardware may be probed before
    1216          * or after this point: it shouldn't matter as the APIs are orthogonal.
    1217          */
    1218         for (i = 0; i < NMK_MAX_BANKS; i++) {
    1219                 struct fwnode_handle *gpio_fwnode;
    1220                 struct nmk_gpio_chip *nmk_chip;
    1221 
    1222                 gpio_fwnode = fwnode_find_reference(fwnode, "nomadik-gpio-chips", i);
    1223                 if (IS_ERR(gpio_fwnode))
    1224                         continue;
    1225 
    1226                 dev_info(&pdev->dev, "populate NMK GPIO %d \"%pfwP\"\n", i, gpio_fwnode);
    1227                 nmk_chip = nmk_gpio_populate_chip(gpio_fwnode, pdev);
    1228                 if (IS_ERR(nmk_chip))
                                    ^^^^^^^^
Error pointer.

    1229                         dev_err(&pdev->dev,
    1230                                 "could not populate nmk chip struct - continue anyway\n");
    1231                 fwnode_handle_put(gpio_fwnode);
    1232                 /* We are NOT compatible with mobileye,eyeq5-gpio. */
--> 1233                 BUG_ON(nmk_chip->is_mobileye_soc);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference

    1234         }
    1235 
    1236         prcm_fwnode = fwnode_find_reference(fwnode, "prcm", 0);

regards,
dan carpenter

