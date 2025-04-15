Return-Path: <linux-gpio+bounces-18812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F0A8958F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7D1118976E9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60514A48;
	Tue, 15 Apr 2025 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sH4M2fRv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA4155382
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703234; cv=none; b=UrQcQe7iEAefceE7ku7/ZPrSvvboOzm3jPLb956ccr27Qp3kcr/v+3Re2NTmu9DOqqhGg2lk50RKwZJfoPkpVF71tUcxg6Jka5HrBrkwa/dgtz1iPQ/Mdbq9z+GCsjP2EgWo2U/pR7F3MFzSfzUm7uE2E33C7xvoE0WpCXu9OiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703234; c=relaxed/simple;
	bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7zhTZAqkXueKijoLMJecu4u0X8n5SdMQcznfydHyNe7Fhda2LqQ9uQgxem2ISlLONCSTsbZU1IJhNZEGLWtonZB97xgVtf8vhm+5wr0zlMPolPKPDuFbUMq/yVzZeGr2Wuh8NZ5ITryyyNiAS1ZTDY/beJC8im9Iz4Sd0u7fz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sH4M2fRv; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a071so25213901fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703230; x=1745308030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=sH4M2fRvg8u17sDlhxuvShic6S8/MK5+Q2ABT86a+TpcvxC5KSvSKGHL7vQZuw9SUX
         NEnXpkb0JKQHsNOqWK0bTT2LcGeqi8PkK7rSRU/goTMkTv27YqDt1IwoJdNFKickP59H
         2exX4cBWyhC+Cx2d2b7qzUoy9JTAJNt5XH+J8QCzxcqMHjQvENJGdGY17BbuX+4keZ34
         3C7COqZ10VuuogB1SiwviVlGahlnJXP7xfxoPQDk5122iBtB6OBG7dWMR4T3NJKIXwsP
         AyFyKG3KMF88UM8Xvjq2ZYoCkJblK1ynE6OC/XDE3hQjiM6cu0iUH9cBBwAha/7jRbPa
         ETjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703230; x=1745308030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=F39a/fcjyDr4V63jZPrB+uoi3hdHeoNsbLj2pJ2OkJet4Y9HaA4mzdGNa/P0RAkak8
         JAf5n66qMe44WHmrjcdUvaojV2LmFuSAhRs/tIadS/gXt7L69LQVGyXze9ZtdzO41r7e
         HNJMCjALF8DkxkI4APtKi69iVoNjlQ1Q9LYqYITzEaRI5KP9qu0a/YjrAKZ0emvyQcw3
         LrhoMt9q5SAv+dU0xu0Al7wEHyp1mMiulvik7dA6BPB+y4hjZevl9rO3JRhpCO0qxton
         m+z7LoPv0iH4O+xWm8bhe+/nTuvcFyVmLki4wSQfbpQ6L4UySnL+xRfH1bVSVLA/1+Xh
         j72w==
X-Forwarded-Encrypted: i=1; AJvYcCWLrlNyxlrfvQMVwmd6Hv147vOLDr1yEaCpxSAgc/Anf0L05uPKu5wpCdAXcgCrffseOIbKjNuEKZXA@vger.kernel.org
X-Gm-Message-State: AOJu0YzKc9ojLYdVQKCGRDmHai93/caGsXlesn82CJGY1oSStBkv7VJA
	W5Do+obHhnZtt8/biWnogCoAzIHOuQYIXRCdeOk9bUT9rhzd4GeWBS6jkXGOLqupmAWfK5Cuub/
	SgvsYy+HPw5XnQyB11j+F1TisG1qFUBHEDublUQ==
X-Gm-Gg: ASbGncvtMsDQNhUyjaZNBvG5SqrAQ4ksiUQhYo4Ql65er2Yo+ih65Evjas4HVeslGDQ
	/Xz1OjCFsS04wD1Or2jKxonBC3u7KTWxYzpoz7EgKydjWYsjQXWmShV3gIX2dL0cdHimBYogHQh
	BS0oa9WWT/1VST/t0B7REHJ4EFBDFc3TdF
X-Google-Smtp-Source: AGHT+IFXq663dVyU8zMw2WCvomgufBQU39frF7BHP8IkhexHxE7q25QYQkfpa6jUI5F57/EgxHrlEfhdYTnxjnPcuUA=
X-Received: by 2002:a2e:b8c1:0:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-31049a80d31mr55920011fa.34.1744703230263; Tue, 15 Apr 2025
 00:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329181506.890043-1-john.madieu@labcsmart.com>
In-Reply-To: <20250329181506.890043-1-john.madieu@labcsmart.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:46:58 +0200
X-Gm-Features: ATxdqUFkCKTY5402WfMD7L4Dn66nYTF8rexDIKyTSCReHIobCScCzKD7ElX6-PM
Message-ID: <CACRpkdY30jnwByCpsAR0Hvmq-WWMRcX5-2PtVtOy-_TD4GrHGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: apple: Make regmap_config static const and fix indentation
To: John Madieu <john.madieu@labcsmart.com>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 7:15=E2=80=AFPM John Madieu <john.madieu@labcsmart.=
com> wrote:

> Mark the regmap_config as static const since it is only used in this file
> and never modified, allowing the compiler to optimize it and enforce
> const-correctness.
>
> Also fix minor indentation inconsistencies in function parameter alignmen=
t
> to conform with kernel coding style.
>
> Signed-off-by: John Madieu <john.madieu@labcsmart.com>

Patch applied!

Yours,
Linus Walleij

