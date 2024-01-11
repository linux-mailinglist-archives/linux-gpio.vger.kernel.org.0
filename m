Return-Path: <linux-gpio+bounces-2137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70382B0B0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 15:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAAAD1C237F8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 14:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1826482CC;
	Thu, 11 Jan 2024 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1Y71Uw2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD4935890
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e5f615a32so6509445e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 06:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704983457; x=1705588257; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GXqINs0a6lZWYxfctjRoUnBJCktVQXQIz0ah9jwfFM=;
        b=M1Y71Uw2rDSVe7EiidH10WvfpJNA+4i2K2N5Oi4eZZhpTGDGIKpbsvfThjpWW2rPR/
         fJuiOlZqVLVuir7R2m/dWN5/dpLvl55yr2fgM44329b0xoSLfCsVI/AK8VUmml4X94q4
         hWGLshjAIXhJoUjy2Qx27/oA/UMhD65ZeMdpNGMP0/jcJlcJ6jmwxsi3HVuehgZR2Vhn
         XdtkOno+s+zWGURfM7KjupNP4wfRs1QlI5S37UqBEI7MNyjuN2fsvge/H3SMasBvedOF
         FGSrrsbD8rr9gEu8T7LNDpSNJg7twz0PCyAToycoDLOaUAe64LWc2udY7TWQnepvE2Bj
         4OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704983457; x=1705588257;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GXqINs0a6lZWYxfctjRoUnBJCktVQXQIz0ah9jwfFM=;
        b=MZo1kWzJB87K4uPuaosPMKmhrgXL9J4VJlfEXujip920qZSNVgNs6HLB6ZpCa9U1yr
         YOdiBFplM64gpcPPN8Y+GBA1OsDoHYlzigeTMxnQ7V++lCFYfHl54ndBRH8Wu5DArAcg
         eXHmTsvHVIM1seE9hWW4IWdxf98aWYEcWRIqZnwT/J0ujL+48afaOfJFxXNSLSwBifnp
         xjQaeCjhXqAwuWlrQ5Wpf59TSf46PN803nWEgyt+fPcctAcoFiYcj9v7CoWwvJZqkZyq
         utOFYX19UCe5CYJ9hx/KONJY85aOnEutt9ikhw1WeuizmxVXioifAD2sRDy8rT8wOi8Q
         vx+g==
X-Gm-Message-State: AOJu0YytfYQEMw8tQ+XIgfQzvQk7KhlOzjQVqLFZPZr65JfjIE28s0Ud
	Uos3IimNrK1Hm5ThrZN9fmy+LtHlHgh7A5QBqdZkRcIOLQE=
X-Google-Smtp-Source: AGHT+IF3PtLmRs4r535dI58WdeoYk9xZeHh65SWWhTjBpeF6keMBzrxZPy3XbqqG5pOmhpQ3qI8kpg==
X-Received: by 2002:a05:600c:378d:b0:40e:4907:d317 with SMTP id o13-20020a05600c378d00b0040e4907d317mr271597wmr.275.1704983457220;
        Thu, 11 Jan 2024 06:30:57 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id hn33-20020a05600ca3a100b0040e621feca9sm1107764wmb.17.2024.01.11.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 06:30:56 -0800 (PST)
Date: Thu, 11 Jan 2024 17:30:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: JJLIU0@nuvoton.com
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Message-ID: <128a831f-6800-48e4-862a-d76b4dd0bb56@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jim Liu,

The patch c4f8457d17ce: "gpio: nuvoton: Add Nuvoton NPCM sgpio
driver" from Dec 29, 2023 (linux-next), leads to the following
(unpublishable) Smatch static checker warning:

	drivers/gpio/gpio-npcm-sgpio.c:295 npcm_sgpio_setup_clk()
	warn: why is zero skipped 'i'

drivers/gpio/gpio-npcm-sgpio.c
    283 static int npcm_sgpio_setup_clk(struct npcm_sgpio *gpio,
    284                                 const struct npcm_clk_cfg *clk_cfg)
    285 {
    286         unsigned long apb_freq;
    287         u32 val;
    288         u8 tmp;
    289         int i;
    290 
    291         apb_freq = clk_get_rate(gpio->pclk);
    292         tmp = ioread8(gpio->base + NPCM_IOXCFG1) & ~NPCM_IOXCFG1_SFT_CLK;
    293 
    294         for (i = clk_cfg->cfg_opt-1; i > 0; i--) {
                                             ^^^^^
I believe that this should be >= 0 otherwise it seems like ->sft_clk[0]
(which is 1024) would never be used anywhere.

--> 295                 val = apb_freq / clk_cfg->sft_clk[i];
    296                 if (NPCM_CLK_MHZ > val) {
    297                         iowrite8(clk_cfg->clk_sel[i] | tmp,
    298                                  gpio->base + NPCM_IOXCFG1);
    299                         return 0;
    300                 }
    301         }
    302 
    303         return -EINVAL;
    304 }

regards,
dan carpenter

