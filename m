Return-Path: <linux-gpio+bounces-16125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C29A38373
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C07773A9055
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008E721B1BF;
	Mon, 17 Feb 2025 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ti2MQg0m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD53186E2D
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796755; cv=none; b=Y8k5IgdJ/SehfuvCkvYNG15F99EM5wREMAdoVgR+fpOfQFlIef93/mlvpMWNUFwlvWocR694Kp+gpEcmgfXNW1JAYBapVoawRkXpdeQYthrZC/guCeJIvOp8JJ27sXBsppcpItxClQBsfyij04VW053KjrRdPoLbjw+I94/4zE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796755; c=relaxed/simple;
	bh=4cACiLEYYr8YRJ3XzHa2YQ3pT6PaX+HTa+ntXXOksSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr6KACj5Bmpu82Uo748XgveZCQewN5UhgtRGOd4k+zZhuPCWljVvCLP8BnTo2fuSZHVYO/XR+yuRvsMzroygaJxTMV+8+pSpVX1iXKxFH48DU/Uf/wITnGZwE20BI1fKyyH51aCTiRKlpJkYaq+iERMCxpo7HDFeJesvOTL3tXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ti2MQg0m; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 750CA3F2A0
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739796751;
	bh=s+2SaUWzMvUfSiNt+NXq0m9a6gNqN22bx5NADQSxlGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=ti2MQg0mWo1R8u42ozYJ/umbSwxvkE2OyKA80zRUM+XYNUvzMifJE/nbZyJ9GztuA
	 Jam7AGIhjNa+6rxhNNLnHNODsMZJC8FSH2ly23d9hC+HlCJZwgnGQiT8g7eZXXM/Xk
	 gQpYlaQKa2sjC/gKqlMfi6pDHQJX9dIFK9/oqN7N2SQe5+aVaytfLwOsi2JNITkqbo
	 qQt6AWldR/d5aw11n6DoPPg6mimCQ3qCPAqAGFzbqyrZ+pyRlvvnx5flL3xgcp2Kpq
	 wpMe4nQHYC6BkUESM1KtyQzN/PfhsGCBFpIj2hZx/6YfuX7kMhHbxpi4qOJEnURbtw
	 rzWUUtSXssurA==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220cad2206eso89305875ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 04:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739796750; x=1740401550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+2SaUWzMvUfSiNt+NXq0m9a6gNqN22bx5NADQSxlGw=;
        b=ONqO7Alt3Fwz0bCBrgoAgbKgWtwDbbNlW+QrJE3NTYZ9P5CUfYcAyVvMZaQ2sKxjlQ
         0lE82X6EdbKAszQ7flV4+a1G99vtKde/wAv3J8y3O0gxlUpIVn9EfDpUYiDJdSS//Pzv
         MwSl2uPQraV00AbFnSDuv1s9+Yj26tJIcfPQfJcKpNselNUO3VB+++GZAIVMJHCq8biM
         Q6o9QOtYMygigalLnFcjJrJaNJdvqKZ122cJElSJGixpRr611MKl4VshYtDKmLb+sMgB
         14UPQ84MT65d9E347b17QMWL2/Q3HrhlmjyVsTYzRPJngFhwkUckMMmQXRXAqaTE7C+O
         aPDw==
X-Forwarded-Encrypted: i=1; AJvYcCUCmUxyg/V9KDb+2cPKmZyzBruB1Mryo6UriVgtG09CfYvtp9TGnRPkbnRmnf9vtT525OBoXpljXd7L@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbi3exyw5LG0KknNcM+h+vMZovqOxTDSm0j5y9cnWCj25Dx9ho
	lUXrWCDWsUd5V6jF2s0Rnih72ZULbfnyWglfw63D7QeF24SGfjZGki7g7c4Z3N6FYp1X+ZuCGG2
	VE13/cRW17Jo6RYd5YzI5IbmjC436K00tdNzP9z7XK8aQsy0HyJ/JnxWopybhA1Jp1aA+UQxb+v
	Y=
X-Gm-Gg: ASbGncvGbkTMpKV+0yA2dp3o7o0sDRTn+wjQNFxwMyTQ5UszA+A1QZ98PMTTX5ezVjt
	6K0Ic2WmA78mIy5mleVFL7mlv7KeEshVI6WHkRxz5y7B83YMnBC7iY5FrULJVrrQiXCFJwVtGtx
	tTg27lUqco0u+CicL5xUlb6owL6KqL6GIveB8F75BhmtCUFoqe4gX7e5QLYCWsFzwkswp6S3QyA
	b+DG7PWSfx3IfRrIYcflKksEiByfIviK2VNrRNvWU60dcODPq8QROhYvpqV014Mr9TszdExSen+
	s7Jf4EQ=
X-Received: by 2002:a17:902:c94e:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-2210404a859mr156408805ad.27.1739796750002;
        Mon, 17 Feb 2025 04:52:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMbDRI/eqmP12xeqgTEQrGMQASyS3MKQlMIr/reZp0+U4L/JqMmchDaU3atyv0A9DB8o3LaQ==
X-Received: by 2002:a17:902:c94e:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-2210404a859mr156408525ad.27.1739796749687;
        Mon, 17 Feb 2025 04:52:29 -0800 (PST)
Received: from localhost ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d62dsm69697615ad.149.2025.02.17.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 04:52:29 -0800 (PST)
Date: Mon, 17 Feb 2025 21:52:26 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] gpio: aggregator: cancel deferred probe for
 devices created via configfs
Message-ID: <4heguj7r4dv5rsbfaokwkslkexqf5r52nm37splnvqwxsfsiig@irvcosdnabjy>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-10-koichiro.den@canonical.com>
 <CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com>
 <CAMuHMdU24x9pxEjBHTKxySxwr-L+iKXSUNFxpM9hvaSTNAWDuQ@mail.gmail.com>
 <5mffw5s3p5biu726cfn6hrgcxiamawxz4qna4jajww3evoievd@itffjdnhijxb>
 <CAMRc=MdjiyzBzdQpYK=qGwS=j55W5mujoTWruRP9DeOv11Y8rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdjiyzBzdQpYK=qGwS=j55W5mujoTWruRP9DeOv11Y8rg@mail.gmail.com>

On Sun, Feb 16, 2025 at 04:58:51PM GMT, Bartosz Golaszewski wrote:
> On Sun, Feb 16, 2025 at 2:15 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > >
> > > On one hand, I agree that it would make some scenarios simpler, and
> > > let us propagate an error code to the sysfs writer in case of failure.
> > >
> > > On the other hand, it would change user behavior. Currently people can
> > > configure a GPIO aggregator, and load the driver module for the parent
> > > gpiochip later, relying on deferred probing to bring up everything
> > > when it is ready.
> >
> > Thank you both for your insights, Bartosz and Geert. I've just sent v3
> > (https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canonical.com/)
> > which retains the current behavior, to not suprise anyone now.
> > I'm now considering whether we might eventually deprecate the sysfs
> > interface in the future. Doing so could simplify the codebase and bring it
> > in line with gpio-sim and gpio-virtuser.
> >
> 
> Heh, yeah you'd think so. You can watch my talk[1] on how easy it is
> to remove sysfs interfaces. :)

Well, I just meant new_device/delete_device in this context so my
impression was that it would not be that hard. Anyhow, honestly speaking I
haven't looked through it thoroughly yet. Thank you!

Koichiro

> 
> Bartosz
> 
> [1] https://fosdem.org/2025/schedule/event/fosdem-2025-5288-the-status-of-removing-sys-class-gpio-and-the-global-gpio-numberspace-from-the-kernel/

