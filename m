Return-Path: <linux-gpio+bounces-23334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82885B0699D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 01:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C67761AA3D38
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 23:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E497D2C3264;
	Tue, 15 Jul 2025 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZoJhtDxQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D42367B7
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 23:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620451; cv=none; b=cvoBM2PN9bAttVdbdOp1DqT56wn93Zz6GkrZ8ZJogFprTophu2WC+t6OnHfae+/+u3jejzPN5LGFsKtvHxBIrA+lkIiiNpj84Ckpa/cbFzOjH94W79RIKXuwRPiih9ez+M0crok7s/bHINH040bNGBCxLawcH3HhcWfQq2H4VBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620451; c=relaxed/simple;
	bh=CTdT2vp5bFx9kxEvG/s4dKF53RJY+mzS0rJDCwFSWSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NqvVB7Ec0cYWCdxnuvgi/fMUnX9oaDVOtNfEQjcSiNvpE7YFqIxGAj10yvkSmnI6cJOzFvq84B0JUypUY7Dkxj26KZUOzdLGlZ74CdUJ9a8Yb/x72Rny5n0uUHcJHf9rHaSrHEmQ5Nb0QOOLSNO+OFnV8nda9WQUOQ8+KyYnTM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZoJhtDxQ; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-73e5d3916f7so438470a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 16:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620449; x=1753225249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFwrMfJ6cVLfoQqD0Dp8yZ99t5DGR4QKc1d+1/VavRU=;
        b=ZoJhtDxQH1pXXogV0JnCqy3Ni4wP2u6tzCDOj9sJi/d8guWvTiNw2m0C2/PtJrmqYd
         fu8Nbda3ZSL6z8cIJ5AuVch7I8kFLP/+WQkSO6RAB16l5oMgD9UTcts7RkRUGv/aS86/
         /h9JrPRjE/f09SJZ8Pg2zetvN5bJq9Yiym/pohnUnZoUuHCRKOUTGy9WLoZM+d8se2Vk
         LMC9yOWqkbeXSQ0Q/RHlj1BieVjaPNSGKHFMF17I2xyMwxzn5hbUSpZMYUdIKFWu34N/
         hENlWyC64YNNALEqXGV3yTxEhmQ5+i/1mBwawVAv7rGRLE/9dCWBnV+FFGuYKSTAUbea
         x1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620449; x=1753225249;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFwrMfJ6cVLfoQqD0Dp8yZ99t5DGR4QKc1d+1/VavRU=;
        b=iU5BWsv+flolMIKt4YMKr3l7bvCvsWfifHg7KeoiT0m666N4ivkop2Kl/MBK4NKtIN
         wYrCgER2/WRVOZT1mlzeelvv50H2wZuhZxK2QiOoqjdMMXFS7c3mQSTEGC+OQselFO9Q
         kbmOpWI7ndOKQpKSEvF3oej8VodWZWpoz1AIxfes/++vg5tIeyQ9TqOp+bExso7/8Z68
         VAyrksIsFIKBAA2YZEsfbWuRpNP9TTnssBOUeAcBn2hXPMkQFem2Rkcj6VPR/cI3huU2
         NqmPeC4vKqibBhOQqR3BCS5ScWxNHo8eKmqhD5/wUp1FGkqFQnzCx+oD8kObXGQyvsOj
         8yFQ==
X-Gm-Message-State: AOJu0YypIBJgN+MsUJoJp2aJSzS9KOUzbJERt6cg2TUbBPq/6wpP/Jht
	HIRPINW1gprXKIOEebaHlxgikHrimqEL9RBuQt+/2uapv4B78SX4UOstobImBCNCOLw=
X-Gm-Gg: ASbGncvkbtdx9S2sSAKnvJLjNi7kUFOXue7iLBabvl/277gVUxpaxbilokFnxLdynQK
	0xWI/GpxplU+r56ybHgO9hUaBX2YSIV9UbLM0rP8TvO7pJ/5xH0Lbcucltg00z9DhC6V9DN9FJG
	o3wpeq0c86l4/VloTM6obzJgdIYbkeFsJ/mGfmcoykHuEsjVQoY9I8WDxnjQaZK6AANh6IpR27g
	JUf2isX8CdudWKElV9LkNjoXr3KA6VGcZvUvoXrJf62C8Aq6CaJk0R4Fr63Z/ViCoIFZziFgw1s
	Ku3o+VIEilj55Z2jrmAfb8R0RfgbB+6T1KFntuZjVOpOaNJIgsz5WSCpS6/Gw2+eTG1UYmyJs8H
	M5hJkf9MZ+w3YrvkLQ4+DMvPE1n2M
X-Google-Smtp-Source: AGHT+IGuFJL6nedSRRsS8QP8zfi5/bi90I3sQOUjYTUbg2Yk6AbF9yKHMxhCohUJXXh9VJSYl0boZw==
X-Received: by 2002:a05:6830:3c0d:b0:73e:5def:537 with SMTP id 46e09a7af769-73e64b1e18bmr1321159a34.21.1752620449125;
        Tue, 15 Jul 2025 16:00:49 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e54544699sm1013989a34.51.2025.07.15.16.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:00:47 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:00:46 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] mfd: adp5585: Support reset and unlock events
Message-ID: <1ab7d052-29ec-4d6a-b0d4-c36d99e95dd6@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Nuno Sá,

Commit 333812da70d5 ("mfd: adp5585: Support reset and unlock events")
from Jul 1, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/mfd/adp5585.c:435 adp5585_reset_ev_parse()
	info: return a literal instead of 'ret'

drivers/mfd/adp5585.c
    381         ret = device_property_read_u32(dev, "adi,reset-trigger-ms", &prop_val);
    382         if (!ret) {
    383                 switch (prop_val) {
    384                 case 0:
    385                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 0);
    386                         break;
    387                 case 1000:
    388                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 1);
    389                         break;
    390                 case 1500:
    391                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 2);
    392                         break;
    393                 case 2000:
    394                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 3);
    395                         break;
    396                 case 2500:
    397                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 4);
    398                         break;
    399                 case 3000:
    400                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 5);
    401                         break;
    402                 case 3500:
    403                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 6);
    404                         break;
    405                 case 4000:
    406                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 7);
    407                         break;
    408                 default:
    409                         return dev_err_probe(dev, -EINVAL,
    410                                              "Invalid value(%u) for adi,reset-trigger-ms\n",
    411                                              prop_val);
    412                 }
    413         }
    414 
    415         ret = device_property_read_u32(dev, "adi,reset-pulse-width-us", &prop_val);
    416         if (!ret) {

Should this be if (ret) return ret;?

    417                 switch (prop_val) {
    418                 case 500:
    419                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 0);
    420                         break;
    421                 case 1000:
    422                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 1);
    423                         break;
    424                 case 2000:
    425                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 2);
    426                         break;
    427                 case 10000:
    428                         adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 3);
    429                         break;
    430                 default:
    431                         return dev_err_probe(dev, -EINVAL,
    432                                              "Invalid value(%u) for adi,reset-pulse-width-us\n",
    433                                              prop_val);
    434                 }
--> 435                 return ret;

We could delete this return statement.

    436         }
    437 
    438         return 0;
    439 }

regards,
dan carpenter

