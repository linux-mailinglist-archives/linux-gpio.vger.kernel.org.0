Return-Path: <linux-gpio+bounces-17930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE70A6E958
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 06:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE6F189561C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 05:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2423119F41C;
	Tue, 25 Mar 2025 05:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZ/YGNtI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C58E150997
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742881637; cv=none; b=ANfG23W2i4Qg5DSrczhEJt9C6WDBuZXMOHBTXpxgsBau3nAaFtqbOk/3+v8ihGJk4oL+lOA6DTxh1KpQ6f+ji11Xwi01qtTY9zfIS3aQjAJ93vV2g8g8SM/5zPITt86NfWVmO373l0GY/JXMzpwDtPS9U0w9WFzzgzJPO1xlz/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742881637; c=relaxed/simple;
	bh=c4jTGfGnsBZNnLqqxRygibIl5L/ixe78/2f2/uSGbtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3/vXYscJuxliZ2LJa561gOksLsxbAO70YrUDixujV90O3hEwTlCK9UjQX2jtQ6ICFNSOLGsFHlCqXsYxLJORM4cZaaHmss3Roia70tVmvErnLn0xMgb5ccQi+z28PSmIXLfYnQvf3a+nMNVnGOVz7WO131Dx0gACa5eeNaSIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZ/YGNtI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso47293805e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742881633; x=1743486433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whPHeHDPWb1OWluhkdd8/iDGoq5/wJGdCJNpRYEBORs=;
        b=SZ/YGNtIdaJLPWYbIhBIynsVj2DUuZPdsZxTBqi35xIsPGRweWF1iEDNcaA/gqhk8c
         wGdXyMRwRQsI1Q8TsML90QdR2Hyxp2nc+7B3uLPooOjMvn6Oghb+KFOPMEdTEWGGIrqp
         NOJXLpA/kyXuGyXnwyTyy2IE4hnCMxB4IjyEPtiv6/pFTPWSRc+mbnTNr+p+R2nMZWEj
         pJ3Jt2+Tm7pBOjjPIA/ThxOMMV8Flvu7rxt7XRZMpZlErJIqomPPhZG5VT+QW0e/KCQf
         dSlnbwbT9vFliQnHgJ18B4QBMAV5Ej/kb4u2bOdHZTeYZJGakjWiF+cC8ILR2PmQF573
         6pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742881633; x=1743486433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whPHeHDPWb1OWluhkdd8/iDGoq5/wJGdCJNpRYEBORs=;
        b=JN3LnhHHcG7Uj5Y9BywmyrZpLS5foASMax1yrttx5US3BvHBxb5O3g+iLF3G3eEXBQ
         wh0r8X+WYGsNcia/d0yHyAngNgiEowPtaHZ69Hsr1i0/wCtdaRjnSXpwyXRJNbcwFFqC
         cPP2d8l0YbsVkmKlU5bhXX70qOdwaQuJ4Ij6O0ngZ27dWPL3OljGvLHlnFx0CJR2WTsw
         7PLxHfNzEqrdUonQ8fWEIZQ5UbowRHvQLdusofOPrI5HcrWbI2cPuGxiSYjIZSNcmtcl
         otLry8QgvFiPs+1BNJa1nBocsVZIUPIdnpze+5zNrJCEXKXGvW06FlntOUxd6WWIGs4C
         dgiw==
X-Forwarded-Encrypted: i=1; AJvYcCVrv3teLe/i5aKEhdqvAeXgQvdUQj8sXyWtrfrT2cuIsGKp9yskxnK5u6ZxilF4RXa7rgoSuzCIrTLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxBRdwjUnpRkiSAuR0FtG7iv1Xjxu/pOCdIc9Bqlcco4KdRqtjJ
	B/uD1QAVBCCeAZ42BjpMNW3KCUO93Ee5wrNcKUm2eYaxXVQihXez3gQxF3i7evLrr+52ALDnBVv
	C
X-Gm-Gg: ASbGncs1XBvpMBj1HcOYthea2npb5Enlmsj1jeDJLk8jiOxHKluSlDLi/tzJT9mtAFP
	dqzOJhVyt9SiJAcptlkb2K9kzkhwtAuHQifwcWl+RRDvru+1sZMYlBO09YU6jaFm8LLPlrcxhSm
	kCrRfNgj/C4n9SVkxLkUP4B8b+sMxKwZB9LRs+zmgNhf+xWn+xA/TYiYmKKMQhzi29mjQozxLVG
	injzLKxv/+4Bvr4MhiAboly/C6NknchaMeDu8hUYLMYyDZ7S8h/ws9ihZvawPySaDqakH9xYwex
	k7ODphOrMHwGPD2ojDpGNO3CaUSjj6e8zFxcN2/dDJTlqFqrFQ==
X-Google-Smtp-Source: AGHT+IGNzmhxmfDpRSL//4YZV8P7hlWa94c/MQzOCUBl2MVttM9km40tpC411Ib7relS5eSAvLZ41Q==
X-Received: by 2002:a05:6000:4008:b0:39a:c8a8:4fbf with SMTP id ffacd0b85a97d-39ac8a85327mr556569f8f.18.1742881633309;
        Mon, 24 Mar 2025 22:47:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43fdeb6esm190742885e9.31.2025.03.24.22.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 22:47:12 -0700 (PDT)
Date: Tue, 25 Mar 2025 08:47:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: mediatek: Add EINT support for multiple
 addresses
Message-ID: <065d465b-60b1-4c25-b9db-1f00b40cb09f@stanley.mountain>
References: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>

On Tue, Mar 25, 2025 at 08:45:13AM +0300, Dan Carpenter wrote:
> Hello Hao Chang,
> 
> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for
> multiple addresses") from Mar 22, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:384 mtk_build_eint()
> 	warn: error code type promoted to positive: 'count_reg_names'
> 
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
>     374                 return 0;
>     375 
>     376         if (!of_property_read_bool(np, "interrupt-controller"))
>     377                 return -ENODEV;
>     378 
>     379         hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
>     380         if (!hw->eint)
>     381                 return -ENOMEM;
>     382 
>     383         count_reg_names = of_property_count_strings(np, "reg-names");
> --> 384         if (count_reg_names < hw->soc->nbase_names)
> 
> count_reg_names is type int but hw->soc->nbase_names is unsigned int.  So
> if of_property_count_strings() returns a negative error code then it's
> type promoted as a high positive unsigned int value and treated as success.
> 
>     385                 return -EINVAL;
>     386 
>     387         hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
> 
> hw->eint->nbase is a u8 so the negative value is truncated to a low positive
> value.
> 
>     388         hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
>     389                                             sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
> 
> This allocation will always succeed.
> 
> regards,
> dan carpenter
> 
>     390         if (!hw->eint->base) {
>     391                 ret = -ENOMEM;
>     392                 goto err_free_base;
>     393         }
>     394 
>     395         for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
>     396                 hw->eint->base[j] = of_iomap(np, i);
>     397                 if (IS_ERR(hw->eint->base[j])) {

Oh, also of_iomap() returns NULL on errors, not error pointers.

regards,
dan carpenter

>     398                         ret = PTR_ERR(hw->eint->base[j]);
>     399                         goto err_free_eint;
>     400                 }
>     401         }
>     402 

