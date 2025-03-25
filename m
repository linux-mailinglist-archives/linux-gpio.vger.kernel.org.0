Return-Path: <linux-gpio+bounces-17929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF9A6E957
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 06:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB3F16DA71
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 05:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8691A18C92F;
	Tue, 25 Mar 2025 05:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/KS9aXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70274150997
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742881520; cv=none; b=DsESRncfbIU1NJ9Tdw7ckvt4jTbvvl+a2PbG3ulDv6w0rnfvyBlGJBJi0GrlQcre5nP0CFtPD2SbmJEe5fxfb/jEjZj0wVmzLXazyCClvpn7CPsxBtgrVBKc02WOslh0Qy0elWDCaJdCT1hC4L9UcrT1UEmzyzaBuL5smyl0H8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742881520; c=relaxed/simple;
	bh=VTQHd7dTUO3z5u2CkuJnYwt28feZ8yzIxGv+fr/Ld94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEPTANT4yJo9mx742XhbbLaGryS9F1y90vXKX3zFu37f+jZ8DaCG/yaT0WaOf2aSIicx2ukmpOdtdaBrljONYAw/hNh/M420MG+Ixfd4rMcay6A7cZgjb7jAn1Ubfxdyi/yowacAlCj0lUXsx4Ulhnv9wCyvQqBU9bzS6Dbjyas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/KS9aXj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so38876855e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 22:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742881517; x=1743486317; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuOW0Mn55yGdA776GNjzbVfbIbXDAQCU4PRgrw1oTbc=;
        b=F/KS9aXjjvF94oQH/jdsmvlTtYW0dIUS/udLd2k9OP6EyeLRg+mQ2ruq4x6nfCAu6q
         kXBaCQYHc3ZHlaSyaXSyXXer36Pc4xu4/R/KDu6BrsroTew5Fe7rbvm/ND9BIsU6lcEa
         0kUbm9jlQuIfJTdv3ebY1oGpROTrvl/85c3WsTzYwh9F0/fAYiQn7CIIllYJTy6jCYBK
         IDbbWfd4ioJ8jSrccf/XemndLLdATcrEX/WdLJqHgWWWNMIA5Z3/MUOS/RylO2svrfTn
         klUxAzFBKZOn9KjuqbfYq+WX1nFf6/ZoUMzQBseLOxZq/Mv+hV6j6pFpb+xY+Czfe0gQ
         1gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742881517; x=1743486317;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuOW0Mn55yGdA776GNjzbVfbIbXDAQCU4PRgrw1oTbc=;
        b=Iskrs3mQyrIlymKxip4sX32IcQYalIqimen//J2iFNgWb7JeO4XQ5xUNtn46xVGAgf
         iiXMsK03CDdt/YtlzBm9hyiXTd9SAGjUCGrE/829PWfgqfbBDLUzg58VArINbdosLK/T
         nEC06vVtBF2d+IICecBPp74+D+lKG3eYV5GGHz0LJQiKVKN9bqn2+s0FZIHflgtBCled
         +ByE34vgDEPktDMfeYhpUA69v5PODyuTivdeihbF6J7R4MCG2mbGY7sd4iunb2jydGaq
         tpZjOruLIrrO9PpWNThi1smRQ9Fdit2IGjA7N3oa2crHzgfDWcSW5Bnkj+dErf5+Moxq
         5bfw==
X-Forwarded-Encrypted: i=1; AJvYcCXyeEucF7tjS4XAnCoIs14ZmPmr7/ADsoZDeM4BybPblKuxCCpOaAli5s9pexIRpNhFrIm6xcg8MSY7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2SgHlEfKX5kz9Rfo17ogzaOS0J1VwerlO9muQZIr3IyWT36lE
	IDysN7D1DAcew92jcwnVaoqSK4dPJyKYMc2+yVZwJqfnnspk035U9+kMkqlwcGLZPYvdH9kJn0a
	v
X-Gm-Gg: ASbGncshkQyeDl27NjJvJO0c2mYLhChSCLSIBH7k41SdKXTcNDMg2c9+Gra96NkFHoC
	9MxhQWPguXMPW0PeLhE9xhsFwdfV2v1/1ORtGmJZ6ifg2umbmTHxeLY0YAkki/iV5lGEj5rnqXo
	a6Jcok4Sf2lrM0pfgyX5sp6mO6OdUV5p2tmuLqqsSS0Uqv6EQ75Pym2uoggote5kHU7sSmusYLO
	HodyGSet18vlf1knFN79niRElhNUb1iKWFKLTL7wGuIaZnuDh9aD5Q+vB3OKil0C+PNJrzDoXDU
	n7GjEEjZtxAm8mE626AbRk+Jk1DVkz7dbrl391k9y1vfFsZaLA==
X-Google-Smtp-Source: AGHT+IF0isVPqVCYpl9rR0NWLH2sdHbJrynsZYBvQ3H0d1pQUJpfgitgI7fDNncvjMKlZBokQOX5Ow==
X-Received: by 2002:a5d:64c3:0:b0:391:3156:6be with SMTP id ffacd0b85a97d-3997f900893mr12836083f8f.7.1742881516589;
        Mon, 24 Mar 2025 22:45:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9957d9sm12693479f8f.9.2025.03.24.22.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 22:45:16 -0700 (PDT)
Date: Tue, 25 Mar 2025 08:45:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: mediatek: Add EINT support for multiple
 addresses
Message-ID: <dac846e5-d15d-4def-a7e3-ce17e74e2da6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hao Chang,

Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for
multiple addresses") from Mar 22, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:384 mtk_build_eint()
	warn: error code type promoted to positive: 'count_reg_names'

drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
    374                 return 0;
    375 
    376         if (!of_property_read_bool(np, "interrupt-controller"))
    377                 return -ENODEV;
    378 
    379         hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
    380         if (!hw->eint)
    381                 return -ENOMEM;
    382 
    383         count_reg_names = of_property_count_strings(np, "reg-names");
--> 384         if (count_reg_names < hw->soc->nbase_names)

count_reg_names is type int but hw->soc->nbase_names is unsigned int.  So
if of_property_count_strings() returns a negative error code then it's
type promoted as a high positive unsigned int value and treated as success.

    385                 return -EINVAL;
    386 
    387         hw->eint->nbase = count_reg_names - hw->soc->nbase_names;

hw->eint->nbase is a u8 so the negative value is truncated to a low positive
value.

    388         hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
    389                                             sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);

This allocation will always succeed.

regards,
dan carpenter

    390         if (!hw->eint->base) {
    391                 ret = -ENOMEM;
    392                 goto err_free_base;
    393         }
    394 
    395         for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
    396                 hw->eint->base[j] = of_iomap(np, i);
    397                 if (IS_ERR(hw->eint->base[j])) {
    398                         ret = PTR_ERR(hw->eint->base[j]);
    399                         goto err_free_eint;
    400                 }
    401         }
    402 


