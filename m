Return-Path: <linux-gpio+bounces-6958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B888D4D3E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B6691F217B3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEE7186E2B;
	Thu, 30 May 2024 13:51:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362C186E25;
	Thu, 30 May 2024 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077113; cv=none; b=phu+mMbqfLX9i7gelzgdlCI4kVJSKzejrJOyykesZh2zyVfd7Th4gZUworfv3ij7Sme7Odcr3/S5RlRg5hHSV4rhNE17VpNLQdnyXg+/Q7eXl6zHkyAhLQk1wA8oLEG1SeSl1oh7o1yLsjlFQQcaERBcN5P2/CZisvaGcKXgezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077113; c=relaxed/simple;
	bh=TENyqI46mKoX4HW6cS3EUxgz9yy9L6nCArFeuE0PxXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2Tkt1/ozOj8lWfGJGvCFhUS2AUAiPOj9CVosSRWYaxg3cmocsPrYQpFv3qIFYjjLOGFHn81ANPMdj4ilC9uLWber+1Jh7+HafA46KwhJBvSrJx4xRJVwvDwwQu64L0F12tDcGijaH25kwM53TitAupMv7snqwbEuO1iD+C5IK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62a2424ed01so9206927b3.1;
        Thu, 30 May 2024 06:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077111; x=1717681911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3mjT3pgErBe5r6cUWu1N9HPpsJoEoQwYcTXRgzlr9g=;
        b=NLZgPLBDFIATfL8npaXyB6nYwyp5wgXnhMkpRcUgijLr3E8DBP1pSGK8d41G0cOnwn
         9abm868h8ROGd26ZCILTQuHJLpAt7NHdRzSFTPV0qIp6bXIgQCEs+L+SVlNY3KnGgilj
         CuFNg0AnnSgDymtJ7NwhXEgqbcuTKh9SvjQZTQC1PpfC4QdkyzKHz0I1JlIO4M4f/PXm
         zLgvNhDeLwNckPPkY3P4cQFJznbNHqJDRi1I2Gmy1WMZhRHrPBIYJ58k1Yz0nUd4ZMA5
         7nEs3KEHJ/ixPaPdIDOUEDHHNFQlai7Ot3Ru39+6M9qxFZgOpEp2K5wYms+62P3YD9tq
         5xxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTVjNLldM6bmYkaiPD+JKkKC+QMhF2FEusYlhLPJGiej5+rTAY5RnJkE5wUEcP8jW4C3qtNWzKJcFpfqC3RRtmmM/l2EsF0jNnVxodpbBUaaa5Ql/nyGV6RYOv6SXz6gESRxsNTWjQu+NzjjncQDpAgbe6it3dyQIEsTIjzOrK0++vpCkI2CS3FHoLBv+EKprW5jarCht9xdTgZ0o/RaUsee+bZDJwFw==
X-Gm-Message-State: AOJu0YxH5cC5oBpWFpk+Pl1/ShCfiVGePE3gCeDwFtWfblifbpVJSzuj
	UslVts5lqO5e8DB66OOJyhOOlQP5dkaLkRTHjPcytZexMz2h83R3aZmKmQmJ
X-Google-Smtp-Source: AGHT+IFdaHexAjRL9bynRfe0kcVbD8zg4JW+tyyzjc9+iM4iqse2MjrEFdSNwdMabZNrm8OapnQFDQ==
X-Received: by 2002:a0d:c182:0:b0:617:cbc7:26fe with SMTP id 00721157ae682-62c6bc2e9a3mr22990817b3.16.1717077110677;
        Thu, 30 May 2024 06:51:50 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a3db0b8sm27690447b3.43.2024.05.30.06.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:51:50 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df481bf6680so855279276.3;
        Thu, 30 May 2024 06:51:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPTGyTOGwyP9av7Ct7etquq3mw7nk8NvXccgm4nW1pWa6TAWBxTR90Uzh76m5P9OheVFAZoKfXBEh76rke1V0/53Yk0YWzD6SAQ48F+XZcFsLQYTvm3zVVpSVX9YpxjaoXzurFaosVctEkyQaVH201BN4tWUm5dX5Q3VaCyMoIc7lw1DM7LbTJt4R9tr9U/ZvSlhYR5+sbECMDHRHqQtqcou38RKfHaQ==
X-Received: by 2002:a25:a285:0:b0:df4:df14:61bc with SMTP id
 3f1490d57ef6-dfa5a60d114mr2487651276.29.1717077110129; Thu, 30 May 2024
 06:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-9-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-9-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTc9DHtjaFpRBzYRrvKe_6Suxe2WppHroircjdv8o7+Q@mail.gmail.com>
Message-ID: <CAMuHMdVTc9DHtjaFpRBzYRrvKe_6Suxe2WppHroircjdv8o7+Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:47=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> On the RZ/G2LC SMARC SOM, the RGMII interface between the SoC and the
> Ethernet PHY operates at 1.8V.
>
> The power supply for this interface may be correctly configured in
> u-boot, but the kernel should not be relying on this. Now that the
> RZ/G2L pinctrl driver supports configuring the Ethernet power supply
> voltage, we can simply specify the desired voltage in the device tree.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

