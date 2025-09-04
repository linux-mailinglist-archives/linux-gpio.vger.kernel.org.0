Return-Path: <linux-gpio+bounces-25609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF4B445F1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 20:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464C53ADD2A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 18:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD8D2641EE;
	Thu,  4 Sep 2025 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VsB1r+8n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881E25FA10
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012318; cv=none; b=MBiIzC2wifMRugUZM4xY/a4tjpXSvcF4P8pFJKyhlVFHz3t/zhTesTsXjzgZdOot7JDmIVzK02ofn9wUofmmfAAwhUXUX1Fcw/n+5W5xQQeg8VSZWE1eiv0yRQV1qr/Rrr9XP37F5k1fxVNT91xBNPQhLCYcOvA/Z7mCt1dzbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012318; c=relaxed/simple;
	bh=eXvwqhdr5kSofiFo/qxPpUj+SANKhSZFihnmnpGw640=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1aG2WV/6UUH3f3WceJvMvYchhs77KH+0S8CHx8HSWSwRM4sChSfbSf+JvxkCVPVNteNunu6ZuxUK+kXBg7gkj7vi+LX3HeatUIiTHb4WCf7ajhGu2/54IjrWXGVw70kNKQikE+DzweWAOwogCoo44nsCWPFWOtLZcJyHOW5xiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VsB1r+8n; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f98e7782bso1627033e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012315; x=1757617115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXvwqhdr5kSofiFo/qxPpUj+SANKhSZFihnmnpGw640=;
        b=VsB1r+8nlysBMHPYCxFE4JKWTFG+MiNWatds6C14GZ0SQJq42TilqQslyEJgJuAFTw
         X60QBNL2twwNTyNFzK0BIYP6lsWuWonoWfbeAOgUkttm7uCNz8xX3s/YAvLjZBEpbaEu
         UFWB+0x6gH+AJvO7cxykB+pUS7qlA6FJ19x9Si389r8Tf2mUBSsjLV4/UAS+7hdXMmmk
         kNWAXNBH0Vwq8XGv994jFuVfR3T1IUzpjs0j4iWYdCKoo3O1No1F7dWGErFCm2ksF7OD
         RUQ5hQHXs+I3rrDvKySnrmnOMEB+0/6hwoBVY+qVxHxmGZ7m8DizDmNQDKTYuy4H7qUn
         Xemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012315; x=1757617115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXvwqhdr5kSofiFo/qxPpUj+SANKhSZFihnmnpGw640=;
        b=VgphBPE3o+AuMtJCwpm/YlgtJstLVtaYlKKjh7TKuFlGvSSb2JubZIEJEGEfta3SZZ
         cKEtToRKSrkSty/UVrplnE+9H0kUNWx4+Jdh6MEdspiomba0WLmi9PnBoBFArICGxGXo
         eMYRBoEqyyI3CWsvFfK/TukdTxUq2Bp+J2zfOHIiBlJCtPVMK5MTXT9eDqpm5Wj5xrEN
         dIs5sAduMw6FFS3n7xXxhXt7gCSZBgiiaqHR2CHbCoKdbmQ+gslh71ahRCfJtsHiw9PI
         728fm1fu9+vhfagH01YJLDqAIJz0lmG4Gbz8BK5/JAqKqisF/1WGL4nXRR2fAVGZHjur
         MnUA==
X-Forwarded-Encrypted: i=1; AJvYcCWrVR9rWD2Kw5WuGACm0bAF61oIp+K3m1OYwxWX7eg8CBH82hij2IDCW9VkUC/Dpw9A4UJSYoKNYfqF@vger.kernel.org
X-Gm-Message-State: AOJu0YyvimvYtgloJDi09UIFbCwxBJB6+V/LXFqwii9Jyi1TkrpiZPDz
	zUVxP4e6cH62jXBxIDir4MBPDMWquuAJyShEAHVFXftYw3J+cJn+PT1oUKvfB/SPUVqfAuHOQ1E
	WCUKexgebESruuEY5Vnw30jMF4epANAncaFCh7TK6yw==
X-Gm-Gg: ASbGnctSYKXz89pwa75mznIjzEdy80Mcxs2sZ0gLWLdBACBgtPUYDYSYi4Wlw6umAr6
	+g91gRo/FvuEswPlhredAmyzhLnQAEcEwZmrS9cgPpUvORMOp2SmnouV1fvw1Ji1S5uplJ85I9A
	HqDhLd2GFIYt5H8Uk+7WKf70DMVSxMXJEr3HRbOQ8aB8qYiJrfbKRacjOu6cFfMeJ2RTmYYUTdM
	Yvoti3GWOo3D5FRgg==
X-Google-Smtp-Source: AGHT+IG+D8oTOCZCybe0jTMWAtEyJVHcF+x1RsxL88xvQswzc/kVAOPXSmL8jd/l58Uw6kNKnmcj7kant2xsnzkphIA=
X-Received: by 2002:a05:6512:31c4:b0:55f:5700:5cb9 with SMTP id
 2adb3069b0e04-560995f4a0dmr209732e87.24.1757012315206; Thu, 04 Sep 2025
 11:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 20:58:23 +0200
X-Gm-Features: Ac12FXymNXEWp0akA1KKPpfwK827qyFlyk8eBQbtNKsw_bFGu0HOwHEo76-xbLA
Message-ID: <CACRpkdZAROUdz1SJY=h_dcUiojazO1fYxGJ8X2KEE6ow7oFZaA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
To: Andrea della Porta <andrea.porta@suse.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> The STB pin controller represents a family whose silicon instances
> are found e.g. on BCM2712 SoC.
>
> In particular, on RaspberryPi 5, there are two separate instantiations
> of the same IP block which differ in the number of pins that are
> associated and the pinmux functions for each of those pins. The
> -aon- variant stands for 'Always On'.
>
> Depending on the revision of the BCM2712 (CO or D0), the pin
> controller instance has slight differences in the register layout.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Fixed up the extraneous label and whitespace error
and applied this patch!

Yours,
Linus Walleij

