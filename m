Return-Path: <linux-gpio+bounces-21569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 973B3AD970D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 23:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADEA9189E57A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 21:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD08273803;
	Fri, 13 Jun 2025 21:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7Jkcrid"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79A273D7A;
	Fri, 13 Jun 2025 21:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848911; cv=none; b=Tr22p06h0cFfwabxZI5WWuwbK5ZE2w39O/eBvjjvi3rp0/cOcFV5Lb3IY8/IUxmbjdhhXR88d1keJz2JGwbmfqFyJsLmI1Io0wLfwI60L91ZnU3JjGog9KYug+cST26cbK4M+1/Uke67ZS5QOgYxS/0TxPRtKAxBBXWyuj5t5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848911; c=relaxed/simple;
	bh=1BAlNC40DIIYTlxPrdYKWUga4AKKVOLZfuHmk18EUeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CX4dCWzkezo43ogKJ1IvtdvaxSFtnBrZw5gYe7RfxkLP9DVzfnyXU1vKcbQbP82yJWRvFGpW0CoVKc2aqoW07GSNaU3kzOSdh/1ZKK4lNYXVDxZmmFqeCg2ToOJajJjI/VsZeghuUVpqdc7vBR8vYHntGBc9bQBs4WQ4vuP0WLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7Jkcrid; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad8826c05f2so473910166b.3;
        Fri, 13 Jun 2025 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749848908; x=1750453708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP8f9H321cpDY7PjjNkFIXkN20w2DjJZC9sAvsk14TI=;
        b=a7JkcridUSwI899GHuni48GaG21a3I6nXh5XwAadCiPYN2GshkPRuGF3MhKhS95jvy
         /G/W55DfPz84GJO7AP33JlR0WYBrcZWSkYdzR92ifR7cNb9U1cqiFAOqcAbU+Ulc2cdC
         cUXS32eZZdWy7+Q0CdNDglLGIZo0FJ0DtwlimsRopXVc3V1Vdk83+rcS9L6EjCg2KgX3
         +ZfaGb1vr5DRNaqYwdzZ+16Syrcn+zq8ic0DpB3TFUEkqbdfwxkUTOu7VqQhYX73EWQ4
         FSdJvSXQzbkbHL16FRy4450Xl+J1E6mSBumiDJNNeiywxMf1Q3Ix86nojXxOV1jzQXTe
         DDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848908; x=1750453708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP8f9H321cpDY7PjjNkFIXkN20w2DjJZC9sAvsk14TI=;
        b=ergLHPYV049fcyYRqcADIjkpEJKP4Y6KY7U25ygIKd4/whpzPWnaM5GLq221G6m2ZK
         /AhwffskX+waMsgdNUL4ee/TV8nnUtN0GaL5/VdLk1di2wW3WnlDO8doJPgGE9q6By71
         K23msYPwyZmFwciWMbp0PRs8UmBCSPgSrBUZ5/n0mSFC5bL8Wxz7yrztPnbCA8cLnDCd
         SOJU3GyI2XQcVLPFyp9Wh/ZV0i8srbtSRL301gAqOKkqXQJvuc2IWj3hrZM9voZ0iOTt
         0ZNm4/JC84jzm5YstfZX3KRQbcsG3Cr8gZMG8x2vNJbUpi3LzltDlgcXfXDJ7UDsunxA
         U5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3CLJ6/V/bYy+gbIuwW619/0agduKLBW9uF1TEm6EXgzM5odsT52mS/GRSPiTN5Jk2hOmN+LcI@vger.kernel.org, AJvYcCVaOXytZ9nhk0Yk+nf7T15KYXrVO/FpOMMEntoIyFfj1XAx4YYn/My2AL1minglxhlGR2hNkJrE3mqO@vger.kernel.org
X-Gm-Message-State: AOJu0YxtAEVxx8sXkhcWBSLkqey0sxXB+xZLHvzA3ai7f3VFwc9qmoyr
	FGDVfFJLktDI4VYYQCqJKgzmQB3tlsVJGZhg+rrvB+fs6e5RXohs2NVBuywK5kzvypoA4E9m5et
	yfLjOkCqgTF5AJ8ccPawMQKrhM4LShAY=
X-Gm-Gg: ASbGncsMI0lsl22pGdColnP0q5GpQVIvHlxO/iVFFL0YhhoBGMVe2WU/uoE+IyujufV
	BdvJ1P9KiaZM/XY6sTDw6gM7z3OZnwqdabX0uBcwe0+SvfcHhz+IPUBX+blNRmuCLZGIS2s9O2W
	4bM7UMc1cWz+JEpaqL8p5zNfgh8ic3JKKy96/SxNivqBjwq+9Wztij1w==
X-Google-Smtp-Source: AGHT+IFsWY5YZ3lvdRtP1H251UQ0HMURmtDSi0LBfNR1vwvh677WfY0+mwSxId1SrjTaSFF8a7NweFe3vpJ7+cNMcf8=
X-Received: by 2002:a17:907:9801:b0:adb:1804:db93 with SMTP id
 a640c23a62f3a-adfad4f61femr57095366b.49.1749848907663; Fri, 13 Jun 2025
 14:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
In-Reply-To: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 14 Jun 2025 00:07:51 +0300
X-Gm-Features: AX0GCFsiAqLiq2Z0quLAABeTm2pe1sVJI7AxoQc4QuY0ns9mKyO4ue_CKtpYGMg
Message-ID: <CAHp75VcfaU41FV-uN=82GdUqRadxYc6XaLX2Hr9x-4RfAV8CEg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Steam Lin <stlin2@winbond.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 9:13=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> As part of a wider cleanup trying to get rid of OF specific APIs, an
> incorrect (and partially unrelated) cleanup was introduced.
>
> The goal was to replace a device_for_each_chil_node() loop including an
> additional condition inside by a macro doing both the loop and the
> check on a single line.
>
> The snippet:
>
>         device_for_each_child_node(dev, child)
>                 if (fwnode_property_present(child, "gpio-controller"))
>                         continue;
>
> was replaced by:
>
>         for_each_gpiochip_node(dev, child)
>
> which expands into:
>
>         device_for_each_child_node(dev, child)
>                 for_each_if(fwnode_property_present(child, "gpio-controll=
er"))
>
> This change is actually doing the opposite of what was initially
> expected, breaking the probe of this driver, breaking at the same time
> the whole boot of Nuvoton platforms (no more console, the kernel WARN()).
>
> Revert these two changes to roll back to the correct behavior.

Thank you for the report and the fix.
Can we also add a comment on top of each of these if:s to prevent from
blind change in the future?

--=20
With Best Regards,
Andy Shevchenko

