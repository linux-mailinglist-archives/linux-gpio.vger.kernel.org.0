Return-Path: <linux-gpio+bounces-27137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449A3BDB07E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 21:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B36E423171
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 19:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9702C0278;
	Tue, 14 Oct 2025 19:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4ZLWjNJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A500225B1FF
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 19:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469454; cv=none; b=pKvFVGQlNisWjDPuOb+TDc3mcO5paPz6roOmjgF+qBYtTV0fIQ2EkBiSumd1wWaattq28/RDUtgZfRqkmpgbxFiG9XrBmB2JYu8pxMeoXAW4uGxxQ3VZwT/SIGKaWxrYjbNS0q9XMbC/yH4YUJXW7yBZpy7heOqdWpy9kWzTZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469454; c=relaxed/simple;
	bh=v7ZDvyx+at8OgOme+TAX8QT70PNDFj+9qBTaC8/DA+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbMfCybSL/j8ND27uNnZmPg7XJdQVnbr0v+/UQoGoP+bZQI/bLzXvWCUZQgdSQ5s1fFCfWW9nilKj4KE7MGSjHd7R4x02Z/15a4sdv2Tzxo56WOsHVyV0VyNblJpbk4z0CPV+KSnzBcfC8XtgSokBQmGQAfnzXYXYSoRXQmouUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4ZLWjNJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57992ba129eso7257375e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760469451; x=1761074251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9u2xhRjxMY0OHfkeZgBaJjHDhZQq+aqtFfr5uDFVIn8=;
        b=Q4ZLWjNJDbCSVz7OScHAy552KlNdqIOKFqgFskvUBC8EtVOZPYNCIEoWl23FlDl2wg
         RE4xw06ZDcScOtGUMxNWIgLfhQ7jz0V89DD/G/KCMMs89ZuoVfJ3oKXakLYviKX5o6s5
         SaNjoRhqoCncO+Duoo8hKb61fk4MGqabEVhAJCfJdLc84M/9Zau82l8yajly4a4X0k7l
         m4oIc2uE9vrIUQuMnHx9JUMMmNhtvYNseplDcVQeZAtFu6G9VjIQcZUs+BhbGeaKa3Fp
         yjDNRObWF5BzPgaukDX2zwlOIkxSKX8LikkW/iLFzoA5fncZ5YHDBtipOs2fEKqg3QUf
         88lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469451; x=1761074251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9u2xhRjxMY0OHfkeZgBaJjHDhZQq+aqtFfr5uDFVIn8=;
        b=R0JD9TXZ0nfwzt84b3nYIg6+cxkTNob0+DWYSqm9Et9tAeIYOXUlcsPwKJDO8t+nBj
         YhOh0Li8vZko3RDyyKHHk7SHbCaBkSmqNnaL49Jv+mN0Yw7k4GE7a6MCTQQlXsx58Mxp
         +c/RuL86apwXv52NNsFtTkqXVyHPdkdrWspcavcJgvJYJ6Ag5o5xTZkveCMjiL/qGxih
         t15YpPDU8jUO+HjYiLQDdJSI/VFZ3FgiU2vn0iJPhGVN7W7FZ5ClPB5AYUNzN17nbb26
         S6sJiAn1dnkzmvfX45fhkfyspfdrXtvaJhdeyk7FZZrlAQC2VMhYpjayfMLpgBHMxdzN
         quWA==
X-Forwarded-Encrypted: i=1; AJvYcCVkTHVenkIXfG61Z35fHQuT1kwfxKaAv0z3JIMGjz4u5JKZtKpOnFafimrzN3wLCO4Z5Jv7TLZgp/xg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8eSoTB6oJIaSIdFUI0b733E275XiRAo0v5xwZo663SdLox1eo
	6sI1WJhdFAibH9U4cRRAYp1wzm1tObuL0gbif4qEJEAw3BuRIixbaAV5seWCrO2X9hz62T8B0B0
	hvPhptTRYADm5kIsY57N6OiOgxnKgRZstzG8uT2wErvXOBEHrEkSK
X-Gm-Gg: ASbGnctPCiXgVfyvvPSIMxwnPJZb3AdzFQgg8GzknBv6/frImQE1olVzgxlm/AmPfEw
	Bu1oAPPDe1WnzZ2A7sOmU0cHJJ+I/uVkH1ZgnPRotYAKMciZ4ebEJG2Aoimmop5/JGNYUJZ0S5f
	Q4cMA01RDbOmzsh672Cxk8acmh8uK07eDgJC4PHlSkmsk6NdwytcpRFUTIcypgtYNO9LviAQmZL
	tIqUc9YDqGA6PBo966suJgl2jo/bw==
X-Google-Smtp-Source: AGHT+IEGUS4Gd3DOiYb0CWjdPtTrv4xdAxyOe7Tv+OqMwGviA724GimvTCnIrTO1U+O4G506e5yK1WmR/GzoIGF6mSU=
X-Received: by 2002:a05:6512:3d23:b0:58b:189:871e with SMTP id
 2adb3069b0e04-5906dc12463mr7452727e87.3.1760469450698; Tue, 14 Oct 2025
 12:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-2-gary.yang@cixtech.com> <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>
 <20251014-backyard-parted-572627bfc540@spud>
In-Reply-To: <20251014-backyard-parted-572627bfc540@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 21:17:19 +0200
X-Gm-Features: AS18NWAUmIlF_t1r_m5_roptigL3TJ5IfhnwTJl60nwKQLpHKJKzA9shz3gKjcE
Message-ID: <CACRpkdYX+Hz+LPvSq4vO2Y_JtruokSui-+CvB8dGua0p+FL9Qw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Conor Dooley <conor@kernel.org>
Cc: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 7:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:


> > > +          drive-strength:
> > > +            description:
> > > +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> > > +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinf=
unc.h.

(side note to Gary: drop the reference to the arch/arm64 etc
sky1-pinfunc.h file,
this is Linux-specific and U-Boot and BSD will be confused)

> Isn't this wrong?
> drive-strength is in mA but you're just shoving register values in here.
> pw-bot: changes-requested

That's right, Gary do you think you can add a mA->strength value
translation table into the driver and let this be configured in mA?

> >       type: object
> >       $ref: /schemas/pinctrl/pinmux-node.yaml
> >       $ref: /schemas/pinctrl/pincfg-node.yaml
> >       additionalProperties: false
> >
> > Something like this, I never get this right before actually testcompili=
ng...
>
> spacemit,k1-pinctrl has a node of this type, that can be copied from
> Gary. Essentially, you need an allOf: for the two references.

Neat, thanks Conor!

Yours,
Linus Walleij

