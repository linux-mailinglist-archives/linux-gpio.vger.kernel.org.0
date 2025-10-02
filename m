Return-Path: <linux-gpio+bounces-26753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD55BB28BA
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 07:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD4F4A1352
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 05:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2501428313A;
	Thu,  2 Oct 2025 05:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFuwkWr6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1E21B196
	for <linux-gpio@vger.kernel.org>; Thu,  2 Oct 2025 05:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759383704; cv=none; b=VVZJSQCF977/APxzfRNC4zNY0CMBfb0vj4q+qMGM1LEiT3Alfz+4TRaplqonZ+yEbMwofQCaRv66q4mvtpvlUSpnM/7b216bBQgAxB4i/QFGOiKOyPmJBuH5enPko+QIBlx+nug58RvQVSkmskCrifmm2j5ITbrHeW/68CdT3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759383704; c=relaxed/simple;
	bh=XvGHxbsFqwJV9iJ0+i1FJwCW/FqgBntxP6PbeKydXSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Po+N6mEDFIXYquLjEp0F0MDhhl8jjDOKxy3AmWf09H8s8JLwzVW3lEFsaOLqjeL2xz2sHaEbRsANugigfJwtE/tjC4TZEDP3cDS2rrTdLt+EInmDXb2R4EfkdlvFCJ0GRyjZw3jZIF8K08NuETA8nKnMeTfmrLgWp60EXsAcTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFuwkWr6; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5522bd69e14so359314e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 22:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759383702; x=1759988502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5x6zJFWtgD3ZseLPAVe670DGxAQ0CKQ4TEPs78MePYs=;
        b=gFuwkWr6Dz6EDEYSHqkzkTjP03BhrLpGSH9WOomiK6FnwudbBABIwzmZHL+U+ubP++
         CEKfS2EVEGkRk8n8c7ZRgtNm6ZWxM/2Axu9UqGjGfDBlsEBKCLuKFl9meXIOijztcrkT
         xTvxZHxuhCWQ4F2DrDs8SDTuQ8/4AVuye0pwAyN5EBQJCoEOwMo/gPo7ONxVi/OvMbrc
         Q78JHIdWDcIroU3cyz+b9KZXuvTlPZoZfg8lt+szfBCg+2c47+2M0G6mfEn9J3T3v0f9
         crz4cTLriNjgwFFhzMB8ajSS5mtmgCrpmhPXhTSXhuK3zTj2uJIk4tWheD96F8lF6LV6
         2UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759383702; x=1759988502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5x6zJFWtgD3ZseLPAVe670DGxAQ0CKQ4TEPs78MePYs=;
        b=GHrEaJjGUD6xg/G8luH4xnZB4YAU0DFB+LGLJuBnSrixSIBightTShgWKTQPlLiRjo
         Uu/q73/Bra4AHYaPci/y7PqCSygvlRSOY9LqFDVdUohVHmz63YDPor4zk8sEnoHLxcM7
         kArmTUm1p+9Tn3Txm+FGR8vrxZ2RfwD1GbXnzZsZxVSwN2E4+4UnrNrze7F3ylerTCfG
         EfvAMbUawRS6kTWfgdvPeEdqCmvxWTpBxoixbrUcZHfBGOqSzEu9f2jnP7tcaE123meG
         YlxHpSS+lyO1NOrrURzCdA0ZMYxjUTcOPBCPZ1LAaXrGPUpjHc45f2VyB8AgxniWrlmX
         zFiQ==
X-Gm-Message-State: AOJu0Yxak7+w6FPSJHYlrwZm0V2e78pU8m05edC0Zpo0qQoWo09kDMXm
	Ypiodf7XldcXhYQBzzzhSbvmlR5foNZ2j+7hZsJdhZ3Qee0M2kzjRhgJwJc4jPBcguHu+IQy9t0
	ORCO9JP8Qv+174x8oMBOdXFEpez34NRw=
X-Gm-Gg: ASbGncs8u0DMK0l9U8vM8YlbqClUW54zSyMQ+w3mQXWi8XvAIyXyVGIJARktcs/XcAx
	FWUhhOvm1qSmKMzsKeuE5sj2tueqs3dum/0gvQtZhTZ99hEYtvYmrqwYPpw2BRsB/VOKi2RWeuB
	ypzfKOtqILZMMopXc68WDwVRxd7zxjKnKA6my8uAhRg5IkjmNdNKViyE8KyHTtNVinn+ePbpUkl
	QY0G/XzGz6rIa94jqCrHifmoYn1e/IZ
X-Google-Smtp-Source: AGHT+IGEkTTfLP5itOz9+QtpvlXNI/0w6Lyt5SdIzsilfoIcWxy7ksT5170dbLBGuvLlhy9yJjlUX158j1bkoa+xNs0=
X-Received: by 2002:a05:6122:1ac8:b0:54a:9316:f429 with SMTP id
 71dfb90a1353d-5522d18daaemr2265788e0c.3.1759383702305; Wed, 01 Oct 2025
 22:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928054019.1189591-1-alex.t.tran@gmail.com> <CAMRc=Mcj3YpHqFqdGPF7YXRHz=56J73TV2oPm70SHUmgXRAy=A@mail.gmail.com>
In-Reply-To: <CAMRc=Mcj3YpHqFqdGPF7YXRHz=56J73TV2oPm70SHUmgXRAy=A@mail.gmail.com>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Wed, 1 Oct 2025 22:41:31 -0700
X-Gm-Features: AS18NWBMdlKKNXnALU_uhdUAH-MGfd6utxEUkbKtTgAAxfxzcWP4zPYorkBPDEg
Message-ID: <CA+hkOd7ch=-Mi10njagF1bwW7fFRwm8fkiWD4RueMih02_12rw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: gpio-grgpio: call request_irq after incrementing
 the reference count
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

> Any chance this could be made to use atomic_t instead?
>
> Like:
>
> if (atomic_fetch_add(1, &priv->uirqs) == 0) {
>         request_irq()
>         ...
> }
>
> ?
>
> Bart

Sure, the reference count can be converted to atomic_t. I'll follow up
with a v2 patch.

Thanks,
-- 
Alex Tran

