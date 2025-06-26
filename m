Return-Path: <linux-gpio+bounces-22259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA9AE9DFA
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 14:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D02DE7A7583
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 12:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC682E4273;
	Thu, 26 Jun 2025 12:58:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5310D2E3AFC;
	Thu, 26 Jun 2025 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942736; cv=none; b=uWxTr0aUFOkqhRjP6O9M07Omkp0Eb90bp75qyTHyCY84sBsdan5ev46GeyRiTegGsNKC85vvZ7LIpdMXDenh4qx8yVBnOGP0s5rgO16tmoBfIvMGsj8fUaa29lfZRXbiCF9uloBRYf/U+7ku0jho7dyshlPt2mPY0f+egIxst9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942736; c=relaxed/simple;
	bh=Rxz31s1jalybzhHEpZO9plZ1vsduJDIIv0TPADNN5ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2alVDyL5x7yqiKMeajIalDHj3Z8v+yCJr0XYTD7MvlHmPk38LQpAlyeJ2dHxxBt9d5woYDs98+OmjAF8824CDVix2GWSJrG/iV+NCbsaoJz0/WnLWq5objq2Iw9tVgHq2GBMGsNR5h6OTePBzO1kzUiZ3a4ev2x9y7US9wdrVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-53145c74e15so303070e0c.0;
        Thu, 26 Jun 2025 05:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750942730; x=1751547530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaL9PeUTcn0rjs8U7iTEFfi3hBYAet6RyYfN2TBKzfM=;
        b=Tu7izLz4NspXkJlTQhybmFmcVVGtfmIANH1pKuOa8rnOCc+yo8cDd4o7/ORjQ44/YB
         SQdyJ0IB6L9oQWcxE2sXdMfIMSCnPUACqAKcCozZ8PUVuJdstlh73iotoVQBTNiIuxUM
         XjthxuGBFQO/rivzxvRazItN1ym0ewBnHBQSH+SZ7Y8fiQaTo2eFpQDo6VCUVubkJaGQ
         acGqeieay/WliHZK221zAcFNF+u+JcFyy/AvrVjcRLZitR9anWs6wwDyZJozPDhHy/Ws
         1NTvNj//pt7k/iWFC/mmwyEcqlfxIHNWUBKgxTFsjMVdmXwEBFwXpoE/mTAEuk/Ok7ZE
         +K1w==
X-Forwarded-Encrypted: i=1; AJvYcCU3nhKUye+EH73ge4xAD+zOgAh0eI8q7ycdOLkBq7Z6gIlL/yQiPwEjelPOjhPnDekcW7B4gkVWXCcp@vger.kernel.org, AJvYcCVpmciNNGSR0nj9jWbX7kSKs0KHcgwhnvKHIO5+Ex1sH58eYM+G6QT+D2f9OXBvwY3lCCjZb6VcXMEHr3hWVy0YQms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1IKcdE5rrfjWKh4YgqjzfC/sCxXXuNaIOIsb52P9AacLi4Y04
	0KvZzdKPjJGi9WVU9j4/quNtJYC1Wu2HM6JgBsgDXpTkxF1Yr73zXR/bd+6d72T4
X-Gm-Gg: ASbGncsR7mMnpHkjwZfUz6aFvBnSv/PxZxKP5Y/UtRqG+oSTFUHTKdWvUs0BYqJZ5Sa
	hwHivqX06QzQVKzOTIEDd4SoLo/Q04Ku6u86eYmIAtulIDkn6wLT/vGu67KLqYvrjOp2koqKWyV
	qoUo+B7IveOxKJp3DCReqswNHtTzhvxYhyUi7s7oB3rdzU+V2/FBv5+aMedi0+6aU/NGNPj3w17
	CeHKMtntUw8XSSpGj3TsqqRY+IXtMqzpvttZLn5uSLBHfvWXZIQCKfYJ3zKnDJ7z/epolZD0tSu
	6UkmJBty27b47+8ARS28EMHorxCHHMdDxdWE8KM2QAfSj2ygI3BsWNYPFOUCBkxasrg3+SjqMq/
	hCClQ3hSkq+i8+OONyhZIYq/kjPBd8+sXQQI=
X-Google-Smtp-Source: AGHT+IEtfdFPll7isOvRO1XBZm70yopFgktd1+R58P77zKcYLIWu7+3/HWRf7/KviuxIRfiOUpXhFg==
X-Received: by 2002:a05:6122:6608:b0:531:312c:a715 with SMTP id 71dfb90a1353d-532fae286e3mr3120168e0c.2.1750942730319;
        Thu, 26 Jun 2025 05:58:50 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab2311fesm2270587e0c.16.2025.06.26.05.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 05:58:49 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7fac85892so242350137.3;
        Thu, 26 Jun 2025 05:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWN+9rCRby0vPBP8ePCzDZ0fDDIOhlly1/o7lExjUYd6Tph2M9GqGtrb6UlnxWgegUFAkSC18Lnb/0@vger.kernel.org, AJvYcCWVhxxZEC3gY1spMpQZ6n1DXcq8tiyBjjy0mbVRuqBzIBFIL09XeiqW6ecku316oW0iavZjrKfygoYeUEzUTa1XXXM=@vger.kernel.org
X-Received: by 2002:a05:6102:f09:b0:4ec:b143:86ce with SMTP id
 ada2fe7eead31-4ecda119bfcmr3166068137.8.1750942729449; Thu, 26 Jun 2025
 05:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com> <87bjqdraf1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjqdraf1.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 14:58:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC_wnzEoK07DYxjQZWanirHRoHmpurSBomvJK65H91tw@mail.gmail.com>
X-Gm-Features: Ac12FXwMTHyHZQw9vOIFZvzp3v-9uQkHC-QpbOQ9GH5HV6sr4KaEYuT2R1Q8bM4
Message-ID: <CAMuHMdUC_wnzEoK07DYxjQZWanirHRoHmpurSBomvJK65H91tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: unify config naming
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 07:11, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Renesas SoC has chip number / chip name. Some SoC is using chip number,
> and some SoC is using chip name on current Renesas pincontrol Kconfig.
> Let's unify "pin control support for ${CHIP_NUMBER} (${CHIP_NAME}).
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

