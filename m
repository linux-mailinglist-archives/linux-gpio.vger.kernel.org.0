Return-Path: <linux-gpio+bounces-24738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E454DB2F755
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 13:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5228C1C2146F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2342E8B6F;
	Thu, 21 Aug 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCtXgylk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF1A36CDFD
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777519; cv=none; b=s7FspiQc46a97/LXndchUjf+4lbOL/mmC7m+urFdKD0qgrBilQKPJxL6B5CAff54/KcJl4652Bri+z9fp3j5g0JQ2QY5TZu6PXhFdujShTbubSRMC7yxvixE2pUUO5tH6ttSbyk/h36/NR184s8IUXJvL/zKkq4MKtbsjxCBxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777519; c=relaxed/simple;
	bh=C1yHBNPn96c3V7CQ1BaXqtWREVYjXTs5jbHzOGvJ8fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXqkDKTl2+iNuJC3rE381IpF3sqYxXn5/NsCjvUyJv9EFtlAC7I+phD5S6Ox0F0UT/MxWdBZXOG4KmkC8gOSunQ7JX49aRYWQjdI5b/u/+bwCoO7pUqrjeFqVjKAExrmuPumjiNHCPQDszzMHWoGlOQ5xx0eA4cy6KOCsSGByfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xCtXgylk; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55ce52ab898so918519e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777516; x=1756382316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1yHBNPn96c3V7CQ1BaXqtWREVYjXTs5jbHzOGvJ8fk=;
        b=xCtXgylkBbfdKJboHDlBwK90op4jRs5JqWNuldY7emQXEfjph29J3zeHYzVY66HNBK
         wlzu7hYuc0Am7d+n/syK1tVjCxWoH+3e72rTBrhkC3Dx5aDIL+MKdCPMo+MkkbDYJW3T
         GQvD+kbfmctw/uefm2A35c8su4EkpA1Wfn2Rz7Mq+1bjEoE4nDoKcitA4mbIIfNVAXg+
         7Ix2Xb0Ls2ATJk50pm1I6IPQxRKbScEbdKffVfd4aO9RjpGSobDGGfARBTaCM+iKEhqr
         hERPw1NK173TD0FcmCdQROMxaa3zWtNMdMiZuPY6C1RavSibckpO8dwpO4lOMUbaTxJF
         xucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777516; x=1756382316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1yHBNPn96c3V7CQ1BaXqtWREVYjXTs5jbHzOGvJ8fk=;
        b=UjjV9BcnC/VC8Rp56XzmQxdA4stAzQlCvqxlkG1gWD36JRyfz9rhYARx+EAdfh+4uP
         GTFIJu5BazHrThBDav2Ex1VKbZabNJ2X81QY3Ibce7MimmTMS4TlAq6LKoCHyt04KXZG
         BCoGolxODxRS8a9t2nqkydO8tFKdRCKmq3ZTlLdeF/tFagiUHyJN7GJWeKXR2N2/NwnD
         qlvJubwmMI/h5VS+pEwPYjpTZx8Nia4S0vkpUlZojFp7t/dlO0U9RNvgzluK5d3ScbBU
         99/KqnL3nmTQ0svKItB+2wS5HBjJNZH6pYL3wm80CCU4pQ3Is718mEJbq+fJU3J0C+S2
         gZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXspJH5szfID9V5cYMBdnhq+Ux60BFZf2Onf6KA8cDfhVwEjBfCSJA8adDBfLYNfLW+ZNgGJ3OBMknT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzp8nmEdPVX04va/xHnaTRymCuvylcDfeicb7Uqh85Kikg0aJv
	Uz+YCuBOo+ZWuujkpmx3ImVvAv49gElkRy+trbQsp/I7L0LXv1wZPsSPPGaX775xlV2Rm+Pf0nS
	QZlB9rUs854kaYDDM5/oms34Epba1MU9oWbpScBRfEA==
X-Gm-Gg: ASbGncuV5Z2ZVJFL1+4CxgWG/96AvPTw5w3ykewIl843uLF5kBcIuTtBEW54SZxnnNh
	TzAPEgxcHPWb524Hz/BwLh14ZDZr56NHuWrK4CqCf7IG4DJH8jhZWJzuobwvkPdO3PKvQkHniio
	dN01JJycPBirG6aVRxmvA/mWMrN0uHgUm11y7CK8TyYOnFb8rf+fWYW4e8USNnsMl8ZUsHNKDJo
	OHnw1heRwwFQ/0F3A==
X-Google-Smtp-Source: AGHT+IH58fB2HF0XIYb9mpaGtP+eqBvxII7AxaSZMaIMfHYj0Aglieg7CeivWcXE0AOhVbRVIpo+wetUS4Xw3r7Sv6Q=
X-Received: by 2002:a05:651c:f01:b0:32b:9c54:4ca1 with SMTP id
 38308e7fff4ca-33549fddaf7mr6881041fa.39.1755777515598; Thu, 21 Aug 2025
 04:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812084639.13442-1-andrea.porta@suse.com>
In-Reply-To: <20250812084639.13442-1-andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:58:24 +0200
X-Gm-Features: Ac12FXxsqYADEtH5a5dR5PUdlqrKLGpwt68yMJcS6gbSE3gVttgWEaGZaRZKzIU
Message-ID: <CACRpkdYPyp7p9Pe6KU9yq+1V7OTykCJrNFzv8KxuzxSDYJ93sA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: rp1: Describe groups for RP1 pin controller
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:44=E2=80=AFAM Andrea della Porta
<andrea.porta@suse.com> wrote:

> The DT binding for RP1 pin controller currently lacks the group
> definitions.
>
> Add groups enumeration to the schema.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Patch applied!

Yours,
Linus Walleij

