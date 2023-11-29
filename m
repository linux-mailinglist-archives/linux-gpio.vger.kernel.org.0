Return-Path: <linux-gpio+bounces-698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C07FDBEE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4101A2828D1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2718F39854;
	Wed, 29 Nov 2023 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NBj+2ZUQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE9BD4A
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:48:36 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5094cb3a036so9586554e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1701272915; x=1701877715; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=92OxtxZwSGpeWAn1meN2/QJvS3h/Q5dejm51Ey+HMAY=;
        b=NBj+2ZUQ76cR6Qhj08bKhy3zQYXWrsPSnt+JtT8KH3qaHhnYm98Dh64V9ggeb4QUrm
         jtlvjxyv+GtaYl+71WIaaen4BMydZgsdw4Z2w2NBO4RTVBJp7DQQUeiPq/bAG4Lu7Ofw
         mQ5rmgQmk441DetuDmzFHbQT8Te7//aOPS+jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272915; x=1701877715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92OxtxZwSGpeWAn1meN2/QJvS3h/Q5dejm51Ey+HMAY=;
        b=YJ9WVeoyHCCo8wAkFLAexsb/e9LCUA2tkPLjwCRppl2tY5bsT3ASoco3uFaOReIdkO
         Oz5agOKXsBS3WH6LJ0tFt26gI+XLIK3sdKZtNjhg7bmvdwlw2iDK3afOTkWN6DywkVle
         eG+/YeFLCsHWxYagTVTr3AmF6xNfgCHksLRAFfs+zE8qw8xWkJhKI5clelkJ8+dcBv2l
         sVuBCF6+SVlQrcKeCzVgZja+1eDr1wALy9M5piNMOR2Xk4dbObFBaduSY93+mmYg8ZCU
         imGCT0z/NV5g1qw2fWNsyakK+I1pUnw1MCjIyMgU6Q8Vg9hr1NXR4aTcOzjenvTzhhf+
         TMig==
X-Gm-Message-State: AOJu0YwflC2z9KjMhwCbm4iYtoKLp4llFaylKFCK+Rr/bF4cyfVWQJG5
	lYh2E5x7trNwr1DC2vxEakmOmLrVdfEO1JTUa2Jf+KRw
X-Google-Smtp-Source: AGHT+IG2oh4LgjicdX0H4n5dcryqF0UBEm4FKSAMhkztyIollrlNC9i/DeoweWBgL9sEeCfReICSPg==
X-Received: by 2002:a19:a40a:0:b0:50b:c7e3:a1e6 with SMTP id q10-20020a19a40a000000b0050bc7e3a1e6mr950322lfc.44.1701272915021;
        Wed, 29 Nov 2023 07:48:35 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512308f00b0050bc1ccbee5sm374484lfd.270.2023.11.29.07.48.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 07:48:34 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50bc39dcbcbso1538040e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:48:34 -0800 (PST)
X-Received: by 2002:a05:6512:1096:b0:50b:aab6:da2f with SMTP id
 j22-20020a056512109600b0050baab6da2fmr11186168lfg.10.1701272913996; Wed, 29
 Nov 2023 07:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdb8dwq7OYUFuyjJCv7VN9mH1zEmibcOwgFip0wDv5H1gA@mail.gmail.com>
In-Reply-To: <CACRpkdb8dwq7OYUFuyjJCv7VN9mH1zEmibcOwgFip0wDv5H1gA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Nov 2023 07:48:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=whZj3WZezdj8wq6thUeRfzua2y2QsrnoPG9dqfmk-=rcw@mail.gmail.com>
Message-ID: <CAHk-=whZj3WZezdj8wq6thUeRfzua2y2QsrnoPG9dqfmk-=rcw@mail.gmail.com>
Subject: Re: [GIT PULL] Pin control fixes for v6.7 minus one patch
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Maria Yu <quic_aiquny@quicinc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Nov 2023 at 07:18, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Here is an updated tag on a branch where the only change
> is to drop the locking READ_ONCE() patch until we know
> more about what is going on here.

Bah. I already pulled the previous one and pushed out before reading
more emails and noticing you had so quickly re-done it.

So the READ_ONCE() workaround is there now, but I hope there will be a
future patch that explains (and fixes) whatever made the value change
from underneath that code.

          Linus

