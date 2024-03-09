Return-Path: <linux-gpio+bounces-4237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAB387748A
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 00:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE0C1C209FA
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Mar 2024 23:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D1B52F82;
	Sat,  9 Mar 2024 23:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLyI/qk+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E7535A6
	for <linux-gpio@vger.kernel.org>; Sat,  9 Mar 2024 23:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710027903; cv=none; b=CRQlVHNmKzIededBJaH+WMG8gHGGFzzdwNwmP4xS4CADYQ3wRUeBwKWJr/UPKwtj5wTmc/YzlWbUvZyW1lAxqwjHJoFo9EPoIzaqgmzuW0+5vnQE+UldaG9MeCqlVILEjI8/mJvJdUuCKcdv1MdjLCy8oxY8kP7dnltr8Zjp6N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710027903; c=relaxed/simple;
	bh=3/X1psLY0Zim7ILl0IF3hRPUcK261kr1dKIcPs6BxMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTVrIXZXn09I6dzpp9lQJevV8/krUQYS1GCc42hwvjqE9HHyZ4owsjxyHZM5vQesAH6cYq9R50aH039HoVHrkdi8efTNrWo96NaPJbLo/OFjv/7v/ptNDtvQzDErkFcFNSaaqjzibI0AI/0Aygp+L4+lM3stMcStlbWtcwCPuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLyI/qk+; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc236729a2bso2932008276.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Mar 2024 15:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710027901; x=1710632701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qceh3sC8kiofPhUeytSOniPbrODQxl3H6CnR4Wu1NQ=;
        b=jLyI/qk+s/RmWhoWQuJbrPZ8XCGTJLIKMQ4kqA1A9pM9FkPG65cQIL1u2lXBXv+Ds5
         +UslktRtXmDiWp9kdkv1cu6rVjFUIBiYFXjvd/8DpoZzSh+D3Vh7PmIu2hBast2ZNPD5
         PN04i9PFrArGm7O/ssv7FThABXkNIUe/j6puUNXcJ7VV8sUSS8XZVHPkgbetAMiv5jEj
         OuN8PI0sXRCHtvgYKjXHVqBdJCV3ruY7vXPPvGdWsTxhllJ2veD2IeIyAzu+/kfkg+b/
         aBIyQSQiVa4DnxwmVx7+Sw5MWawM/c2RjD1PODtf5t6T3VN5qYJJpAi4LTt7++XKTSJr
         81ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710027901; x=1710632701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qceh3sC8kiofPhUeytSOniPbrODQxl3H6CnR4Wu1NQ=;
        b=GanIr4WLYZGVemdGbfoH2oclY/OG8aZ33pofmcnJHvkMM+CWtHXN+jyBoay9mrd8Ce
         QqavbbZ8V7U4p05QqtZDJhuFokWhuMEpci+bqklxphUzjnfeT34fG+c8u7S+9Swbw9v7
         JVH1cjqVoHQn1smX9vt5JD4SduDtZLLJvbKV/448q82/yFw5QVADf3zMF5qE1ozO2D3j
         T2l38DSsV6pwKM5bc4TEH7a/NFL8kjKu9Od0VP1UFp4xMisF7eQujOZvbgJ1sO/z8wR6
         n+wwCv69JBQAM3ZDdyuHOup5CXT+sMx0NyZ0Of/QMrCLUvKE+fgpaIYs+hGL2HJ7vWNG
         ZjXA==
X-Forwarded-Encrypted: i=1; AJvYcCWifo8tnTw7zgF3WPmUze1I+OreA+B3vkM8BrIzcVRmesjaEBQkEIp6jjwnC8+9rGM0wun9pR14eOLeJJFQWZwmsB02kkpQrs4zLw==
X-Gm-Message-State: AOJu0Ywl1sIX4iLsBvIscbDxVRzSBqtpeXmyOTFoZt8sZlRi5Hjw4uFJ
	mnjWXkvMrFrx8nm4PG2BGY/ouEL5nt3TwOWU4OoF8dyUtTnMQLG7FGQEhH1PHVxh5/Xj3cSiDOV
	LmWs/Msqf03xPWGh8lFvh0zgCs++jambjVyhsdw==
X-Google-Smtp-Source: AGHT+IFjQ7Gcrqq5W6UpC7l3IWPSk0nRWcufMO5FpukUPjCY39q7UzwvY6a72jclK6kDbiYQJofABauyhz+jduzN9j0=
X-Received: by 2002:a81:a214:0:b0:609:ecb9:77c with SMTP id
 w20-20020a81a214000000b00609ecb9077cmr2763677ywg.18.1710027901171; Sat, 09
 Mar 2024 15:45:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129092512.23602-1-quic_tengfan@quicinc.com>
 <20240129092512.23602-2-quic_tengfan@quicinc.com> <CAL_JsqJfsWaj9OPkvc34rBvx7W_3v9+1kZqNu6QKDsA=iWAA4w@mail.gmail.com>
 <CAL_JsqLbbRFijBXS5CyRm0P4FMY7bR3UUdgXA7xP4Z1oRevnzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLbbRFijBXS5CyRm0P4FMY7bR3UUdgXA7xP4Z1oRevnzQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Mar 2024 00:44:50 +0100
Message-ID: <CACRpkdZ3uhyTnF7YkMk9sOeJJFZ4UPEna7PwpqPeBpWDdAmayA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: update compatible name
 for match with driver
To: Rob Herring <robh+dt@kernel.org>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 9:10=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wro=
te:
> On Tue, Feb 27, 2024 at 7:37=E2=80=AFAM Rob Herring <robh+dt@kernel.org> =
wrote:
> > On Mon, Jan 29, 2024 at 3:25=E2=80=AFAM Tengfei Fan <quic_tengfan@quici=
nc.com> wrote:
> > >
> > > Use compatible name "qcom,sm4450-tlmm" instead of "qcom,sm4450-pinctr=
l"
> > > to match the compatible name in sm4450 pinctrl driver.
> > >
> > > Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl"=
)
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> > > ---
> > >  Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tl=
mm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> > > index bb08ca5a1509..bb675c8ec220 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> > > @@ -17,7 +17,7 @@ allOf:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: qcom,sm4450-pinctrl
> > > +    const: qcom,sm4450-tlmm
> >
> > I think you forgot to update the example:
> >
> > Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.example.dtb:
> > /example-0/pinctrl@f100000: failed to match any schema with
> > compatible: ['qcom,sm4450-tlmm']
>
> Still a warning in linux-next. Please send a fix.

I understand it as applying 1/2 is the fix so I applied it.

Yours,
Linus Walleij

