Return-Path: <linux-gpio+bounces-17681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61114A64FEC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 13:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F96F1887C1D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 12:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B418F23A563;
	Mon, 17 Mar 2025 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpw8Ef9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20F4238145
	for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216197; cv=none; b=OTvHPbB4+YpDZ/BUXNBKGdndk7gTp4HxlLOHwmNhfDk7hl9ZIz395KGDzrKd/LKb9Wu7OVlle5Gwqe8zRzqSRpy1OpSoeywv2KEYY5fn5WwTAd25nsspInKnc2dNgXqIPK6KzmC5PIpLvhUzyN+0VRtcwJawLjzAZTYfrB0rd6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216197; c=relaxed/simple;
	bh=qhR+stvQyKNFKrc3dX73Q0Oj9bJ1GSmvzUPtxWmpD7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uzei5Yl6EglA+XUsFRhJseANb5iOwLg13A9DGXLMSvyHFgoVAOQ+bYr1YDTzb/uulpFmYGzI8yMFb+utEwa3A9dvBvSpBcaE3QF4Ubpnx7QzhmAo4uD6lHpg9W0t23HCkeJh5pptqmeJfNIfmvrSu1Js7diUS1UWohx/GdX5Hlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpw8Ef9f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742216194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pLLA8B7Q6RruRJ/SeEP0F06UuUK/GekT/XdbY6Zuva8=;
	b=dpw8Ef9fZMrNYIlqz5K7dGdJoS+7uFtQcPQgZDId4Sjlk4ccdU2o+aKI6mLF6GB16WjOGR
	7sZV1nVK/v7xUxmVXZJgcrxb76/F36vdhGBMI6RSGwsaJY55KTKkywRKWAieuveJzA1DAa
	2xTV0QHrUvMr08QEgNDC+gYP9TSyIe4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-LDSulizzNSG3POXKDChZ-A-1; Mon, 17 Mar 2025 08:56:33 -0400
X-MC-Unique: LDSulizzNSG3POXKDChZ-A-1
X-Mimecast-MFC-AGG-ID: LDSulizzNSG3POXKDChZ-A_1742216192
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-394bbefc98cso2874668f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 05:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742216192; x=1742820992;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLLA8B7Q6RruRJ/SeEP0F06UuUK/GekT/XdbY6Zuva8=;
        b=lm06Zp+NeX0lT4cbXABrGq6InNWL7Qpzi2ZKAqQz64ec+aZTaii3Y1AI/zrFe9plhr
         FcTFAAIb6RogbyNIaAjPdGuwv0LhX5rq493BncJ0cu9bEUAMdEs+yfULZyGl29eBB/j6
         jzSwLmOJnTi+dy3+SfyO8bzyvy805FfbioaFCALQEg5MeHNxjmEC9pbXr4FkFDzGNz+q
         h3v3QivD/t23znqciZ//xtEPY8X+GDTnljS0LBT3HoWSfHzqjwqzyTusQ2iOTt9mKHby
         B9WUgfU9d4NB/mFNLRR04drHC0Rn8be78IBPW5GhqxXu5a0CoFudX/qVQVAkcKP5f1mo
         qA3A==
X-Gm-Message-State: AOJu0Yyf2otuBgMj7uDHPmYxpg6EP9GJd7xa0vYIqxAxsHstZdu5QCR+
	NubqzUz8e1rsVecn5C7iwL399TFk94K0ZsO/nlDpeu921qhcJsuUWlahGpTEvucx7JIZVSVKshp
	+nJSP0Jnh87PHdXg/Y4NRn8Zri12+ZuV02oSVt1bbCMaL8a6lQaRF3LbyeIg=
X-Gm-Gg: ASbGncvc50ZVmbmuDPxz9lbiXQrcZc/F2fZsWtxVPy/BupNEPQhZaaNn6eMKCzQVsDd
	tcVyv446qC/s3PHyUyfWzidHdWk1Nbgv5Wxh4faxZN4DBJ5wb5Nalse5A+LgZFhnCP3T9a9Ns5f
	fNfi3m4rb7rWpY/5kHNlT87yoFutMFIRQuABMpHCMr0ycOQWHpzGBqY1t7opagIwYUMIf680XRd
	DZ2IaGfLN0wToSQr9zsRZSsAEeUtnYdyhthqrWiUKKTuLZ5aYxsKWOrS9zGfRhM03frUM6ewSBf
	BaE5b9k76cWR6IzVS+15vZztSPOBTZhZFVuwx1u4z+aFXoIPFsjyeg6lF+XBxDlsSe48AXRRAQ=
	=
X-Received: by 2002:adf:a189:0:b0:391:2a9a:4796 with SMTP id ffacd0b85a97d-3971e2ae2fdmr9145129f8f.18.1742216192254;
        Mon, 17 Mar 2025 05:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIpr8LRCQQZUxAWE1Jo22GeaEAUfQFRwAkofiJzd6KgF5dHT33ZaPc1Wl2+/7G725sqDyAdQ==
X-Received: by 2002:adf:a189:0:b0:391:2a9a:4796 with SMTP id ffacd0b85a97d-3971e2ae2fdmr9145110f8f.18.1742216191872;
        Mon, 17 Mar 2025 05:56:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdda32fsm104214085e9.4.2025.03.17.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:56:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
 <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>, Conor Dooley
 <conor.dooley@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not
 default to y unconditionally
In-Reply-To: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
References: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
Date: Mon, 17 Mar 2025 13:56:29 +0100
Message-ID: <87msdjdddu.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Merely enabling compile-testing should not enable additional
> functionality.
>
> Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


