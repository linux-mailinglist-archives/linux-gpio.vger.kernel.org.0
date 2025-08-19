Return-Path: <linux-gpio+bounces-24540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8FB2C027
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CAEC188679F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E54326D73;
	Tue, 19 Aug 2025 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9lRxEtm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948227A121
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602520; cv=none; b=pSfKamaeVRtqvdtUTEbk6VhE6vxWmcRh7LRM54TJVV3V2l3BlvJe3QO+lXaZRB2l1yFcJh3vjLA2e/4/91K5og6N1Gg/kKe/TR2dnpO12dnEVnAg0rjqwBOowWKyuTzupmsNQnW+RMZJfMw5pSAhKOfoKS5x9rFupttgDlH3QTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602520; c=relaxed/simple;
	bh=IM67WPQOHye2i+1z72epmy92Qmx4agSMBIMH1WeYbtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5aiyTgCT0zrX/inR6QtSlDTrjj1Tm+Z2VrOQYvQWkkUx34E1GStHduaR/g+ObavAmVxRKA+MqBMzjGYE4z3FO0J4XTrR1AxbkE5PPq0oxXFlDdtmKOlLr0JJU+G0emI4ZWNfMryfEhOVAa7EmDOWwAhAeMKiXcaS6nZywtmNGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9lRxEtm; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce526ac04so4866017e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755602517; x=1756207317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM67WPQOHye2i+1z72epmy92Qmx4agSMBIMH1WeYbtQ=;
        b=S9lRxEtmzA7oK9h9THtttYlUjrd7ofW2ZMrJ9D7pMv1o1fj7mtqKB3E9469Qup5SIk
         7K8HEqNinh7RKpi/f6utKGZmXFVw5jy6cAuQdhin1Fnb6BqyVD8WiAHmW1sTfnP8JjMP
         IVWUspHWPgI6pKJN7PQ6X5Nnftlxg/DC+ON071kiEKByTO3O7YPBJqHYBdTBtYTMu3TY
         X+T0HmuFznKbQc6fRKTpJCGOFQ1KxGEKsBAH5Vmra6jV2RIi67FSosGIbKGa/6L5N4Fz
         HG5iV3N7pwTc3Gk9bZwTLTIvmXe8loJvrjZ8TzKVMQVxqdPG3Et8poiD0YveaARe5euZ
         Escg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602517; x=1756207317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM67WPQOHye2i+1z72epmy92Qmx4agSMBIMH1WeYbtQ=;
        b=TfXM5/SkWobvsEunGdcAWnwfkw3arGR38shOyml6L1AsoxFaJVWTJW0zpyZd9tlEZs
         14h0wDd5O5iUQayQbPcwDrEAx3/DGk28zwpl2wpfL1J34oOu5azJZ17zHkf3rxxHxnB1
         hQTWQ7tTPYRRY+dti0R8XJrb37ytei4h7Kmpv2rNcxUq3YV/gLt4hQTyyf1GYrc6c2W/
         T+EJbVhg5V3NEiM+L+mkLhRnHdz6OCBL6tjm1P8qM1UaDVgs49MTaA3ckocuhjGPFq9h
         H7qpsIVY47XYXVrSo8pc/EMopfc8M41tO8/RcITGZ+cXJjUXt+Qkw+v4B92Kgn7SHxzQ
         YZhA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzgYEdo4mnJi2gOZCIBwrl9ANB378q4GdLwBnC8/gNsyfoiW/0ZtrDoVkRRAMY7vaWEiLc29cfkv+@vger.kernel.org
X-Gm-Message-State: AOJu0YyfpPTIEFOguxVj/J8zKEsnUDhPZZIq1WBjbWSFewM9Ab/OxlE8
	dUBqyDEetGmvYgDsZLS9T7y0d8jO1FyNvpmIDS3X+QnYWCA+A9JKuxZ3SCFhA4vzOXepv3akQWm
	Fcj0g4/iKZk66GoN9ZFwzvou+hQmKWeQoBbOW2OvPKg==
X-Gm-Gg: ASbGncvo9MyIp1aD2u07d+PMt62UiWVXTd5gYHLqkJGT8/gX293fHn1qMkUvMKSNs1s
	ANIOtzjV9y32s2ywJIIhjg9Ho9/LFzVLQjoC1knuTcxq5njb4Fbvk0e3mAZEXTgsg1+aB+hApen
	XGLCTgF0MJ0q3S2Hg+D+hrZA5ickGryXVOhfgadciLUCgprEmz2gyA36kbtwQRjQU6+UDfserFy
	ABa+Ps=
X-Google-Smtp-Source: AGHT+IHB9ZE3HHwBP8KRu0As5tM0j3eS8qOs+KX5e0XlvnFV/qrios6LpoJC/eBjHm40/aNMJAbseQeE3Ftd5lSOg8c=
X-Received: by 2002:ac2:4c45:0:b0:55b:8698:6a1d with SMTP id
 2adb3069b0e04-55e0079296fmr723607e87.3.1755602516865; Tue, 19 Aug 2025
 04:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812203348.733749-1-robh@kernel.org>
In-Reply-To: <20250812203348.733749-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:21:44 +0200
X-Gm-Features: Ac12FXwBOtQCyCuqh-xFzcRsUI8fbtRh0MGdvIn7jfDa7EoepbxRk616CgxWIGc
Message-ID: <CACRpkdYxFj9ZCdpOpE7G2A8cNTRTWoJatDP7OmCkkH_4eApz6w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,iproc-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom iProc/Cygnus GPIO/Pinconf binding to DT schema
> format.
>
> The child node structure is based on the example as there's not any
> actual .dts files with child nodes.
>
> The binding wasn't clear that "reg" can be 1 or 2 entries. The number of
> "reg" entries doesn't appear to be based on compatible, so no per
> compatible constraints for it
>
> The "brcm,iproc-stingray-gpio" could possibly be dropped. There are no
> .dts files using it, but the driver uses it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

