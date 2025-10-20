Return-Path: <linux-gpio+bounces-27318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4738BF39BB
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A062C351C6C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0113346B1;
	Mon, 20 Oct 2025 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JAr70K18"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2F33438F
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 20:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993830; cv=none; b=Z4/vjyakIG4frUdL3rgnteLi4vPWd1r/QTmQ4ebxv+Jbg7OsCY+0EdeuVUfraQbtKwk9yn4sWQCec0VZ4PYd1x9Ybibv1o/8TFN5IPVeWAYtn5RAsgbMthl+Vej8XcgkY382jBQ2s2atnOsg1M5TOm0Xs5X3T0RHPuv/v2CXgNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993830; c=relaxed/simple;
	bh=TZEYp0wwdbVO5FwvBARexBlR01VmAiUyIuBTdS4/y2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzIQQ+/B6+FYml+USPtAh9jn0oD88AcwiEQVpFk7nOZuhej3yjkqFXTDPoPFozSPgQ3if9K3eY4pjjjddCuy91HpziLdVjBfkN1F6GFN0RqeZuTTpzy67yrwRtocoen/BdBpKBZB9+1af6ZcKsZ5n24lXuOtvcZ0gYW5PbAiF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JAr70K18; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-375ff2b3ba4so53097971fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993824; x=1761598624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZEYp0wwdbVO5FwvBARexBlR01VmAiUyIuBTdS4/y2k=;
        b=JAr70K18zwjf7rO1hWXsRM0w9OgHLcMrtjYGyQ/rJuw5uBRdcupcBz8l/ZsbCduJZV
         Yld/i8QwEtkkJXlgxWx6cQFZtP/q6DO8xzb6X8lDNqAHrgeklmdwiuHM8Us1sLz3KGPB
         h0/2+sYKbu1u/Ra6ig77wJtJ485rPzLXaEtnxW9AHgJGL2BPNN9AAJ+0qMCh5C2rboPH
         OWUrIChBLhyY8BwJZaYna4tqzmX6SGsaFSOPXGdFfWOfpiJJQE2NByd5bshgrH94PH8Y
         yXTYsKHvn6rGIJ0NlVr37EXCK6Blcsp/U4TWMtEIDEZgNUEBOVZg4/9MZ6q4kHSkAmtP
         qUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993824; x=1761598624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZEYp0wwdbVO5FwvBARexBlR01VmAiUyIuBTdS4/y2k=;
        b=Vfs2/aw8in0UyH3QOr4vjjdqGUqz6bgHncKLCB8iPS7nTpTwSSuL9kUCtajN6SuK7S
         vdZ0lNcBf4lS0XlU/bFYzHsoaMg0o4KzoNN880v1I0J6CavKZXUIa47rlc2CKtzNWySH
         xeZ39wMVhdwkC/JHftNV2iGZrP0T61AQG4qmF/kSbZo1QqP7l8ROfnDu8bXTqkT8Xm8s
         3kwVX78juC4dYrccr2C1oA/p+Hv9agjUxrvIfA7gjld4/g5a8j37KvrhnIAZZeiX5Cq8
         mZ26o4hWPfXAl7o3JMt7vIqwIPmNTVwiURA8eKBLkuop6C46cGNc7doVFF/LcMjZKh9L
         CGbg==
X-Forwarded-Encrypted: i=1; AJvYcCUWR/hDAtSFi+j8Q+MPqrbQyXdd+ub66IILWnJjTlIm22sD596mIMLWkDSbY1mYBpf9uWnScAYQcTNQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+knst7/dm+akTUEWON/KQSx9tLbmJX0mhWTVNAOlAFZiiPnBS
	9CSVyipPsF1RxN2qLkjVFc8Np/5bdWaWWydj79o5/1GXo1rW1At7Ooty0QO4OQLr3hsXIf9BDkK
	MlB8OiJ4aGHeN1N/VsP2M25ZJ8IvuGWisLmWJRJM9RA==
X-Gm-Gg: ASbGnctuYd8o8eNlWouswKPlNvZzmxIjv+kE+o1S3gDyRJXz3ZMNkGwHpxuYofu7RgC
	SsxeVBjPhIfky3HWr9kqi+sErA8ShoyOpFqCNtC5E7XbVVrZ0omJY/aaxSOw5VJTT6mTGDUEkhB
	dYvmXehEJuRXUMtI+kAFxv/qAvCNMttKs2USc5tdvl3JLb6YZSSrY2BTAGzjPuIzbGssScBUOWw
	yL5X9mcM47hKxTa4CqlILznvTlUxljMFZ71feKUSCr0yI2cb2eWw6enE8KNJmT5LmRhpwo=
X-Google-Smtp-Source: AGHT+IHW/3fH8VK8UvrQO2N1p8h2n0H3HlH4UW/gOsTzZ7h7xtAZlPnMvG79X4+aymc2cjxzZ7sc3DkXHSmcaHjBQ1s=
X-Received: by 2002:a2e:be25:0:b0:375:d1e4:21d4 with SMTP id
 38308e7fff4ca-37797a9f7cemr47365901fa.44.1760993824327; Mon, 20 Oct 2025
 13:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013191218.4136673-1-robh@kernel.org>
In-Reply-To: <20251013191218.4136673-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:56:52 +0200
X-Gm-Features: AS18NWCeioy3mWv3ZhVPApAQA3XGSmMWhoG9OZEUlcYBSQV8TD2OC05OSxkf5sA
Message-ID: <CACRpkda6y0anNZ0dCHf_OQp-2q1g9LfXWqWD7mS44L1rYsZKDg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert actions,s900-pinctrl to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the actions,s900-pinctrl binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No comments for a week so patch applied.

Yours,
Linus Walleij

