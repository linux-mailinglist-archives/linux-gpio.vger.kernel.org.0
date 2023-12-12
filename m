Return-Path: <linux-gpio+bounces-1290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6880E74D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 10:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DC1E1F21E9A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 09:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C332F584C0;
	Tue, 12 Dec 2023 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpy1ZgsY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE51115
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 01:20:03 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1ceae92ab6so720956166b.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 01:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702372801; x=1702977601; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llkXNhFmI99A3k/pNSmAkKa2DxqYjB/NkVyxoYAQECs=;
        b=bpy1ZgsYvLsbHlzWjEOVYa0N45lCm1ptt8sl9iruRw5AS1c0qwVCN5z1OzYK27x2KE
         mylGF1IyOd4YjXjYoqwlWjq9qN1H7ppqpqVOVF3ZjXIgVFy2uWB5ZjPZ0qn4VYr7Volu
         UnVQ6A3mr0uyveJz8FZgz2ryFW1hENYlbx2HX9Z/L8bu66tFVMEj1GIR+X+jH49ZopDs
         sMQ0ukONO0pyK7KN0hmDLkZnWFl2o3sCMYSWPdNz6aEYwKlv4g3tMP7ScTtf0t9DtZt1
         N89WQcFtei4f4YJGpXnqL1TjMihr9+c+BIv3xWdW63jm66R3699S5Ods+Yhe9Ay/QLQv
         RdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372801; x=1702977601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llkXNhFmI99A3k/pNSmAkKa2DxqYjB/NkVyxoYAQECs=;
        b=oGfmTlK5qrbFAb0JjA2BeqUPf7Lr1IMzyzal0jYmD6WLzL+kGuRG4fPD1m+1BPvieI
         n07+gOsiYcPgfOuHOPG18AQECxsMFlM59FlJua5pOtClHUD5gYH+AwstDZ3C3cS922ND
         VFG0pE/5kVFpVe8yFKGtfkAiToBsDguFUOxUdztjHIIvk2M93GSk7SsrtPFyVVFP+nz4
         ViEmQzkCyD17rRKEPq4jAQrZm1JZf733TMOp3l8AIBxc4AFChlfr491VXajiJPVp2tek
         PqaCRLwtZrcUU3m/iWOYZRDxNcNPPRJas5YbC79hkdQeK8MIOvPauQegv21o/+ELaE0q
         oVUQ==
X-Gm-Message-State: AOJu0YwUi/9ZF7QQAtbKoPlP5NU4pwWVIMdZPmgE5rIO1sT5P2T0T1JG
	28T/zLvcYIk/EhkDkqqh41o+Rw==
X-Google-Smtp-Source: AGHT+IHZrphsOPjHkI8MLjKh1la9WKMBiPlcqYFe6U+ayupCtfrM0joNNssiROMjsXK9TzgmtrVR7A==
X-Received: by 2002:a17:907:7f87:b0:a17:8181:4f3 with SMTP id qk7-20020a1709077f8700b00a17818104f3mr3374184ejc.49.1702372801602;
        Tue, 12 Dec 2023 01:20:01 -0800 (PST)
Received: from localhost (h3220.n1.ips.mtn.co.ug. [41.210.178.32])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a1f75d21bf3sm5206019ejc.6.2023.12.12.01.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:20:01 -0800 (PST)
Date: Tue, 12 Dec 2023 12:19:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bartosz.golaszewski@linaro.org
Cc: Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org
Subject: [bug report] gpiolib: remove gpiochip_is_requested()
Message-ID: <62588146-eed6-42f7-ba26-160226b109fe@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Bartosz Golaszewski,

The patch f8d05e276b45: "gpiolib: remove gpiochip_is_requested()"
from Dec 4, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpio/gpiolib.c:2402 gpiochip_dup_line_label()
	warn: sleeping in atomic context

drivers/gpio/gpiolib.c
    2392 
    2393         desc = gpiochip_get_desc(gc, offset);
    2394         if (IS_ERR(desc))
    2395                 return NULL;
    2396 
    2397         guard(spinlock_irqsave)(&gpio_lock);
                       ^^^^^^^^^^^^^^^^
This takes the lock until the end of scope (the end of the function in
this case).


    2398 
    2399         if (!test_bit(FLAG_REQUESTED, &desc->flags))
    2400                 return NULL;
    2401 
--> 2402         label = kstrdup(desc->label, GFP_KERNEL);
                                              ^^^^^^^^^^
Can't do GFP_KERNEL allocations while holding a spinlock.  Testing with
CONFIG_DEBUG_ATOMIC_SLEEP will warn about this.

    2403         if (!label)
    2404                 return ERR_PTR(-ENOMEM);
    2405 
    2406         return label;
    2407 }

regards,
dan carpenter

