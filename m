Return-Path: <linux-gpio+bounces-8004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E7926061
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3017B283975
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3D61741D8;
	Wed,  3 Jul 2024 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2JZjCn7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726F176AA4
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009988; cv=none; b=uhcX/SZV/wmW1moGPqQBdnnYzK4+yk24BE2PppvnvpXCjIC9ZUuayDL717Bkgi03axTpfRtR0xTww4dWNZZ/nqcyCxMQaDpsCxuJ0bi8ukGZ0H+PWZpRFWtTgsFfU8IhWQYdkFaD4I9/P5zMGHcgoiCHKDBgCzC/BPbFVixGXC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009988; c=relaxed/simple;
	bh=vSqtvzn0M3C5j7Jfg2sByI7qK17/t+Y4ps+yPOtX6zM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCxmsCWVhiHUJX+T6n+dzHjwTJU5AHOQPG3FScJMv39rJIJdUh5YjkhkZbuxBJlS91TPi9D+0LbeXycntXwvPRDVIHc9gDetZkiOZa+K7BsKLsPVK9F73SOEdqnh66R1qb7Rnraj+JNLnYsCPr4G/bPqELJjqbNq8gfRf0kLITI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2JZjCn7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso59498891fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720009985; x=1720614785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSqtvzn0M3C5j7Jfg2sByI7qK17/t+Y4ps+yPOtX6zM=;
        b=T2JZjCn74zERrn3toAtkV5skfQEMISGuyIkNd99xJrCaIvnYpMDE6AArqlXQGe5x8g
         Mo3Q84DQs3x3pXLH/4pzSVdRgeLtkD8Fu1aQ8brqRN+WskSRqGN9CmducP7s7I+/dRZb
         O3dMbLgfN1n8PWewOBS48B/eoA9EAL1Eg3c0lxJrIN/hX5hR0gT++4RiCaBVv/lv5+JP
         g0xboyF5AgZzkOhTrX8Dus88WHkqubi54/HANpZoTsfDjANrLgs4B51qECC1OLqiek0k
         qy0anD/xtdWM0FSUaLEYOZlDUHAF1epXVEeJmkfvjho8lYE8zGXT9csI1Mf7C3p5y6tI
         AAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009985; x=1720614785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSqtvzn0M3C5j7Jfg2sByI7qK17/t+Y4ps+yPOtX6zM=;
        b=kn9rzU+nUCP2aPHza0dVYvhzi8ev5VzFo9NZ+y/Zr4+JDNbajsS3/EPSg2GZV4UKVv
         JYCqbzaLu4AebWacZk18VL6CQDIX5G3MXUdAg/z/Hb+VnVoL41prJeS48ctROlDq2TZh
         OfLTZs/6MOJqtaq+k0Lh9X4HsrdqRkeT2sScbXyvhL39VoEhPM/lj+66IotPPzLoO2sf
         kS5oZwMVf/dNO4u979ZlEqeKpEHCsfV18qYMAr+O6lGV8qL3JNOsm9Tq4SpKX0f474mX
         mKXX6l1xSNW+qzQjqzIdbvm8Di36rxsdun8Oug+zjHUkbAE0t0pF+LNalujDjT6DUkXj
         vMYg==
X-Forwarded-Encrypted: i=1; AJvYcCXsxS9JuNPmIDM3QJ1SW7fQECrD0m/egGY3fep6qnxzh4mGkZ2ZJIGXYyifpujXtobH5cTEZ4sRukVEBdgNX0tCE6MA4CnVninakA==
X-Gm-Message-State: AOJu0YzGQKih3lN7Hx8E79+5vw5Tlb12uDYgQxiWeHnEYMUndTUc2a2p
	35N3C0w0amaXw3IEcgs5q3xPId0G12lNFceEt4iwhqrifC6SGfC1A5SIcf8X6gdthiLNBzo942j
	WJ9T4Fs7H+F2dsguC8EUPS7uFFV7Az0fzeD+3iQ==
X-Google-Smtp-Source: AGHT+IGbnlRShz/3hXmtetfc+0EghD2fIMBX7fxnDCTNRN+4rKt0LgTOhBhEx8FxkTdV4WjFp2QkGDn2ZSiYPJqUaMY=
X-Received: by 2002:a2e:a58a:0:b0:2eb:ef78:29c8 with SMTP id
 38308e7fff4ca-2ee5e39400cmr79485811fa.14.1720009983878; Wed, 03 Jul 2024
 05:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
 <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com> <4106f2be-be0b-4263-9e61-c3a29e837a7c@linaro.org>
In-Reply-To: <4106f2be-be0b-4263-9e61-c3a29e837a7c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:32:52 +0200
Message-ID: <CACRpkdYAXGfAdrDeDArB=fqNGt44GyY1Xq3PAToExcP1vuBP2A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alexey.klimov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 3:42=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 26/06/2024 12:04, Linus Walleij wrote:
> > On Sat, Jun 22, 2024 at 6:49=E2=80=AFPM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >
> >> Add support for sm4250 lpi pinctrl.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >
> > No major protests against v4 so patches applied!
>
> There was a protest from Alexey, that driver does not probe correctly.
> Can you still drop it? Not sure if worth revert, though, better to fix
> incrementally.

Alexey sent a patch so I just applied that.

Yours,
Linus Walleij

