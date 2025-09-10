Return-Path: <linux-gpio+bounces-25921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037AB523DB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 23:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFA611BC6C37
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 21:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FF230F7FB;
	Wed, 10 Sep 2025 21:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUCMaj25"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7B62F39BF
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541071; cv=none; b=K6hVOUkVt9rzN4JkoYOCUl2W2RW5ZttAta1fYhv0qIYTiHJsJUeam5C8rugwW6uQqV6G+jQiSVWowNJ0oZOdBPcT1nSlnN1FOeHOr3znXZM5ot9TJW3R2wTiEdHxgbc5n/Uqjrgi8L4flo3zg+rvtWYLan+WO36B2Pi2u9iIOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541071; c=relaxed/simple;
	bh=o95v/+Gki1KYTrPyXr39Fj4FLKk98Q6CUu2/j+SJkls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+5N0XrweFz9RIJO3zqVpY6VIad1+quvF6IiIXf3QN7Kk7bv4EvL4k3LFGNXc/ogreY89o8JDgW5H9M3zqh4N2jMtrkKpH/NLQ1pRLPoBXfYHqNdi68it4VhNbvqkBVqWPSYxMTjQHp+FVTxE0gmj2rfJHIqcj0SVqKgV6YEeYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUCMaj25; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f6186cc17so8388e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 14:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757541068; x=1758145868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o95v/+Gki1KYTrPyXr39Fj4FLKk98Q6CUu2/j+SJkls=;
        b=lUCMaj25tQhXcGFY9D49JqORZtpH3UmMIfCSRICie6AeBAXTG2ucmQFL5J3kyTOjMr
         GqN5k6s7s7bdpSWx8c5oCiSYU4Sbc6GEHlF78Pe3p50GUHvC+ALN45xW6bZJEHXwEuSE
         DhTp8AdigzSmAzdS+VKPE6zo0Ynywrra60+YIEPpRqYg1kOILa9FD9TyqWYFyoGcCUPy
         qCvARQTTJ5mBd1ShV7sIUoEvzSfQmvPWDKIo6crDJFWaZRY5aexfXHkLJY3PBoZH24IG
         WAhkw9c+ntdcIANOIQdwSG/ZX2iqKWzt1TVpVB46ZLdEs4/H45yI9hN0YG9B8Uk/njKI
         5Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541068; x=1758145868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o95v/+Gki1KYTrPyXr39Fj4FLKk98Q6CUu2/j+SJkls=;
        b=jgI8wvBskshTD/M1QliP+ySSLGLgmpP4tnOES11H40CqA+vSfubvZoDq2+4Y7YClrt
         tASsXC6XOJlylxukyGh5Y24rnWihqA4G1WUS9RjFWlbv26g7LEPPOJtphRLsrk0udXpb
         swga+nXGmvYTEFpCdrl/ZE9URQcd9CKVrgjnnOQsMzFFOlDMukNZTfAz7GERE9ElswfX
         MldeVfhFYafd88qMnwMg6xoQ6PqiZWmmmz9/Ok2h87RiUqdG/8GhCYVqrfFphMj67LZg
         DMRkbbpcvkEOlVYrPz+cFc/6JnExpNQfmkSAevnyG56QZ/h8xBBm4mfgA/1+6Ek+JYWg
         V+9g==
X-Forwarded-Encrypted: i=1; AJvYcCVbRosKI2NwxDypfK7N4ZRt1C7ItUbwGbSDJtGvBh9Um9jgcOgew20RaJZ27i8H7NBj2V3k+7xqcMKS@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ6ha747P1tXtY9lyswudrptDpzS5hvBqkGlHbTCMyp/Ar6vDE
	DE5d5pAc2zfLEunocwL3DZWCdcFtpqzV1z9sSk9h5Lz/VGpv7ilP8nq9czj723mcebUuiD8vLwg
	vXry0oqKipfQVoTM6A5t6Rps47Vi2VNqW7wpD+uTT1A==
X-Gm-Gg: ASbGncv7t0MMOLdGCUNJ8iUhWaeXt9YGkGg/GNLQYVqJQRYjy2qOWPT1o1YAal35ahB
	DEew3RQUylt/qZOKPOLpz0jQ9aXDeXzgv7H2jfZx7d5vn2oMvFOaOjmxUU5qQxMK7HZW3kmagZ+
	kYR1vFUgDwH/LkYeAG27CqwL5bQjKgBulNgRD3OM/+3DOogOVW11zvN5K7kARoAOH8meU+52Pr6
	vJnuR8=
X-Google-Smtp-Source: AGHT+IEJlIdE5osVu7CFRz1B+V23ahz3lLGypCenTLhiP4qfmKZkgsEstnnmYSdvYj0hsFA8e+enqb/RwpOwngd12h8=
X-Received: by 2002:a2e:a54b:0:b0:337:9e3b:895f with SMTP id
 38308e7fff4ca-33b43430959mr48580621fa.0.1757541068033; Wed, 10 Sep 2025
 14:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com> <CACRpkdaX2VPAb+vihZ5BEAsGy+jNUdQ8q+3c3Q78uWmqZYeu=g@mail.gmail.com>
 <PUZPR06MB58879640C5849ABA55EF0C34EF0FA@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB58879640C5849ABA55EF0C34EF0FA@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:50:57 +0200
X-Gm-Features: Ac12FXwBa9ZOv5SOk4OUSUTF518ns1CoJ9PMufbvw3-fq3nVHK7Qp4WDBqsYJOQ
Message-ID: <CACRpkdZzqRo9LRkF8=BSDANweWd0ccWtu5_nznDUn_FS6Fb0BQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary!

On Tue, Sep 9, 2025 at 5:30=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> wr=
ote:

> First share a good news with you. It's that We have verified the new sche=
me pass on Radax O6 board.

That's great!

> We just have a question before submit new patchs. As you know, there are =
some macros defines in dts/dtsi file.
>
> Where should these defines locate? We found these defines locate in inclu=
de/dt-bindings/pinctrl/
>
> mt7623-pinfunc.h on MT7623 platform. We don't find arch/arm64/boot/dts/*/=
* -pinmux-props.dtsi.
>
> What's your suggestion? Please kindly remind me if I misunderstand and mi=
ss anything.

Yes these are old habits from Mediatek platforms which are bad.

Since they are not bindings, just convenience defines, I would suggest you =
move
the stuff from
include/dt-bindings/pinctrl/pads-sky1.h

Into
arch/arm64/boot/dts/cix/pads-sky1[.h|.dtsi]

I am not aware that using .h or .dtsi has any semantic difference,
maybe the DT experts can tell. Maybe use pads-sky1.h to be on
the safe side.

Yours,
Linus Walleij

