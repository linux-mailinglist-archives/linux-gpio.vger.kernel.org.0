Return-Path: <linux-gpio+bounces-16156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152FA38744
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 16:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE42A188C85C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415CA2236F6;
	Mon, 17 Feb 2025 15:11:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DC9153BE4;
	Mon, 17 Feb 2025 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739805115; cv=none; b=H3PdofwlbaE3h2N517Nh69J2I6dybN8o6tR2UblZUm5iSTGjNy49xTRiJjkDVcKIle37K8zZSob5uS0+aGpLS//L3Bhe//pEVNQJXwqwpPm8d9JnM61jpBbdFlHIFjhpTnE/V9jIB/P4ZeiIwZaIFfubL2mgCKL1oYZ8pKgSSJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739805115; c=relaxed/simple;
	bh=CX0cKuWIN/izcmRShlftpFObnQaAOxE9smmXy7S4rN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYmyWZmC4V7oxDIky215ws4aU2wAjs5bDjL0WjuTZSAk8n6DwW/xiV8PeCsjoQ93AuURxp9WE3MLBimsgpP6765OKgpdLnKCtH62GxxCt2YRfUpiBwCvQv3vvNwD1ihOj6P40h9+z1btHOHhM8zvkvlzFGdMG/+f4x1pSk7Eaw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30a29f4bd43so13223831fa.0;
        Mon, 17 Feb 2025 07:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805109; x=1740409909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CX0cKuWIN/izcmRShlftpFObnQaAOxE9smmXy7S4rN8=;
        b=iFUdX6H2WJ4tNge5kwtZkgtcafLDYRl6iQkytXA/jigtHf+orWvYrJsn6TpFDBPEVH
         M4ySPH9ww+R2SwiKmD6n/NUg17IY8xPNOEhpZsZqz2u67Ha7xjHQ6bzr9XFxOb95FNgU
         A2vKDtKRlw7srC8I3n1ULyk7eB99UEQpgP1RESfvLmhxNZvrXdHY4pD983EnAKfoepXr
         c2ytzu+SSdD+v66ldVo2b1P2A76vleDpRzSojUJEJIEFh+roBOgB6hknVx/kzKsM9xF0
         YvySV00MEm+PW6yyJi4OgO0a2iK4HnScaqk2Hw5+ddZFTchyWOYnYdBcs2TGjMjiuKSO
         UTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYoTML8GH7qySOQLr8GAUV3WYUiEbM7cGUj3H5W5xqoWcEA45yJdckILOnejgipfQ25+Ad9NgLMO24fdmP@vger.kernel.org, AJvYcCV1VQKpefQiQ+bBRSkmws9yxhmbBJgvTeABGq9P6xyMtQ9ZPs7IWnWjytCvHhkduIC5CPEDq7DtLkEf@vger.kernel.org, AJvYcCWzjH/Sv/DS51CG0qUvA7LUNhLJw34bzobrPIVFBL6ETidCn/URbjLAT4wRgbM5yXLm9I3wtzioJry8xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxywsegRZfioq7sSF6t2KSVHrdVpQIwjViAwUaK8dRssiNFnJgL
	YFBQh02McPMRniBzr1iWdBQecEjgH4m7nP99kuyMkelQV68mhx8JqHOhA6U8
X-Gm-Gg: ASbGncuAfRQcpJHRuOzxF9XJBUj1KtivHiJ4OrO2WMMCALIcEA1NKqvmUercWt1119U
	+4lNGkP3w09pLtRuFV8YD0mXUFJrmW80N8UhOpSmW/uBbSsa2sGpnpUcK7lT8Z/JkYL89YfaZQz
	CzMENTHZu+D9krFUTK7GomsRoR5gPbPyo0/x4YKVrTxZ1XolUopdQmLt6WLhWSi0WyzFZ9DRAUN
	UogJiUCR6ynApJCgAzh4qeVggbKE6U5HLmJp5GwWVX3IPWoKBpUcr+PPdJQprd0oguc6415RtY5
	vuue0UtVmyhnAyGl24eVkYqm7RMJPbTRD4jvDF3TpqhzzHyM
X-Google-Smtp-Source: AGHT+IHj++LTeIzgNST746kkDxodEu67oATgfZGueeInGzoWvyYEL5TkAsuwx5AUOYyg7LdHQBAQkg==
X-Received: by 2002:a2e:380f:0:b0:306:10d6:28ad with SMTP id 38308e7fff4ca-30927a2e2a2mr23540951fa.8.1739805109320;
        Mon, 17 Feb 2025 07:11:49 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30922dc69bdsm13543631fa.12.2025.02.17.07.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:11:49 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3072f8dc069so45721231fa.3;
        Mon, 17 Feb 2025 07:11:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxVmwRrvOH0h6OVhImMgIsOcfcAcHbwX/Z+Mz+3jMDYITgyEp/z1CDvC76GB5RebOvnaiyk3IhVlKjTlUc@vger.kernel.org, AJvYcCVPX8LpOyuDPFBXxZPwg8KpX2wSguIRbP8hhXCxmEN01CTtDYNEf8V7/Koi5ns+nAi4UdlDrXyPw1Kilw==@vger.kernel.org, AJvYcCXOXWo2+igayphfla5YxFcKWKPEmjUEJQJDqOYukPRj6o40h4oo247TiODB2EAtDXOSsAr8ym07hWpz@vger.kernel.org
X-Received: by 2002:a2e:8757:0:b0:308:eb58:657d with SMTP id
 38308e7fff4ca-30927952830mr26737901fa.0.1739805108110; Mon, 17 Feb 2025
 07:11:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-3-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:11:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v66gSuv6egek05QfpRZNH=Rn-eZXxQ_GVfDWpJ-HuojX_w@mail.gmail.com>
X-Gm-Features: AWEUYZnwpP6pvAEUU7QbWQG6w8gtn-pOi6TW3aQOb0FOCh7uCxrlelNQmMUxnZU
Message-ID: <CAGb2v66gSuv6egek05QfpRZNH=Rn-eZXxQ_GVfDWpJ-HuojX_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: sunxi: increase number of GPIO bank regulators
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> By design, the Allwinner pinctrl IP always supported up to 11 GPIO banks,
> though no SoC ever used more than 9 banks so far.
> The Allwinner A523 has pins in all 11 banks, which exceeds the number of
> per-bank regulators that we currently support, as this was set to 9.
>
> Increase the size of the array to hold up to 11 regulator structs, to
> support pins in bank J and K as well.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

