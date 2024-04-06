Return-Path: <linux-gpio+bounces-5142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF989AB4F
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 16:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFCFF2827B6
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 14:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A1137719;
	Sat,  6 Apr 2024 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMFqLXb5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF12E64C
	for <linux-gpio@vger.kernel.org>; Sat,  6 Apr 2024 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712413336; cv=none; b=X2qBaDDMheGVjnWwPqICN08hIk4fiA9L18k0Dfzq/EeTK0JMDSE4K43mDXBZDk82isWnRauv4YvF/1deasdeB8LNRWD9hFrYjXZ0ulGUaXiM+IML/2sAFc5UOUayu+a8RPEW+WsWJksa3Q9XPKIQ2b+moedKX1ZJUr8LQRqaYrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712413336; c=relaxed/simple;
	bh=7MxaN7HvVCnRVPPOmvIN6YnSbW7xtJwW1a4olR8t+6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIJ/zXNSWbo0BN0lXOnnSCd8BNI4X2gbUU0lRgJJMF128LcGK3LachF8tnx02lJycTeFYAkSecl3ofPyBtKIT05xNyZE6O3jxfJWpKxHslKUPsR/TLQvd1gBX4CV2aPbGqdWl7OUU5XPzbuQU3SVT30jv1oJpHp27dLnMsj+nmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMFqLXb5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a51a7d4466bso169171066b.2
        for <linux-gpio@vger.kernel.org>; Sat, 06 Apr 2024 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712413334; x=1713018134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MxaN7HvVCnRVPPOmvIN6YnSbW7xtJwW1a4olR8t+6c=;
        b=YMFqLXb5+wTSxqZFaJFU+yQeIahuBRz4g1zUw6fAboVaydCtVMfeLGzup/YVvMIz4E
         rbhaPkwUrQjhJYvFhUr1PFr2jbU6tfyEP5JFIDFgmwwpkeeVUZZjLEK/H8zGr9cBuWNc
         +USYQ6SeihvyOiZMVUnAJYFakaa4ViO9jEq1i3eWSs18YBlhhhCKkxxA32oCsbuUsJqm
         Fj8WZtsSFscjn6w8p24ceORr1rhY56TNEVp9TonPX2yNnFA5OlOQHTRn9XRo84w7V7v6
         +NGX+id57vh/lEvNzewCfCyc3KxLRU94T0cdX5DuGjApsXjAJooLYfozbNPDJJ/bC9Nl
         s45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712413334; x=1713018134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MxaN7HvVCnRVPPOmvIN6YnSbW7xtJwW1a4olR8t+6c=;
        b=oY6wO6uns9fDun6wf8OzRbPr/N+HijcF7jQsD2zgtMnpfhF+ilzyZ+uhaBB2Bh3ylL
         Z09yLIF91BYqE01Rk4sNOJpycUVhnq3sAdq9TgL05OeZxsNG7vlMdj1RdzOGpefKP9wM
         z/abTvW743aSUVX0JNhrntY41sHdqhr3yvYXRLfmrBT1+ui5A3qIP9wETUtPx57HRkq7
         qCLDlzBIdlp4lGH/hmxkx3/jB9tPvCulKA/CSqN89k1EXWdBm6TiIttDYN5iMA8zE6gB
         F+Y+bbgapMwyqnM1OX89rpiro4thjkC20TRLTFi5OnhYOViHmQM0oVSat21o1A0g9TTM
         b4/g==
X-Forwarded-Encrypted: i=1; AJvYcCWSdY2pM5eWJkOu4/WBw6Fk83dvaWnHF4XKxuK0Gbj/hLJs7gsNYRFodo5bEKEwLcKaZl58YvDUXA6flX17sxj9ST3wTFhXtLK/Og==
X-Gm-Message-State: AOJu0YyROnlRu4kEQ8HbLfMKs3FvWDnAa1lf8mBrlW4p/4F2OFk8ZiUV
	qNC6upiDczGHvl04FSyNUiJf9LcqV7pIGcA/wJLwJ7u6t1Ujbiz4jPZjqGikhg/RY7tpi+Ii6IW
	LFNQQt2h/uGd2KjFZGxAEiEum3VI=
X-Google-Smtp-Source: AGHT+IEF/Jitc9PvRJMiYjhmpbHOAFxhhU5Jr5elD88EfLqsOccjDcQ1wonKYiB1SKiRRoXKCRPOONacAOGGMSpAKSA=
X-Received: by 2002:a17:907:948f:b0:a51:c6ec:e4f with SMTP id
 dm15-20020a170907948f00b00a51c6ec0e4fmr26772ejc.37.1712413333858; Sat, 06 Apr
 2024 07:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406123506.12078-1-hdegoede@redhat.com> <CAHp75VdmtmV4eEdohrbg9zqbG=mSMJhN2FV9AHWojtQe+hSPBg@mail.gmail.com>
 <33c6286a-0362-4e38-aa80-5e845b1b8fe9@redhat.com>
In-Reply-To: <33c6286a-0362-4e38-aa80-5e845b1b8fe9@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 6 Apr 2024 17:21:37 +0300
Message-ID: <CAHp75Ve2D9sD3QyRNR31m4ktbXG3rBe0TcCxc5VcawNMXejFLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: baytrail: Fix selecting gpio pinctrl state
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2024 at 5:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/6/24 3:52 PM, Andy Shevchenko wrote:
> > On Sat, Apr 6, 2024 at 3:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:

...

> > I'm wondering if it's possible to add some code to imply all these. I
> > mean to have a comparator to the _gpio in the naming and generate them
> > at runtime and add. In this case if we add / modify the original one
> > the rest (for _gpio cases) will be done automatically.
>
> Yes some better solution for this would be nice but I don't have time
> to work on this, so I suggest to just move forward with this fix for now.

I'm worrying that the _temporary_ solution becomes a permanent
solution, which is not good.

I'm okay to move forward, but we need to evaluate how harder it is to
implement the better one.

--=20
With Best Regards,
Andy Shevchenko

