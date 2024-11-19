Return-Path: <linux-gpio+bounces-13101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF739D272B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1474283DEE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA481CCEF5;
	Tue, 19 Nov 2024 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iGFCx4jY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC761CCED8
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732023757; cv=none; b=tjOrmdPzlhiw+PW2uiIzek2BmEp7hU+0kzQ9VV1TYiWa6sAMf9ho0Y1UDg8fStow08/nS3a5ydvuNvS/AYuS+mVQvwOG98IyBYsjGSM1tAWrCTp5prX9HHb8+J06zZVWFa4e+k/lQvtk7DnkKrPWaac3VWE8uAnfuFzA1ZX69uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732023757; c=relaxed/simple;
	bh=nTK472KJ95RfcYltePrdW4BL09/NGY5p6CqbFYSQp1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTL8wm3XD+hnjUMdli67wr9K41mz8KAHMHG+7l78U0uRSb1gI8S22HE6IzYMqA39UE7Y4Ki7keN6hqOT8eFfCg3VloJa6FIVBGPhG3wXAqjegAftA8IvdtfBv/SvL2yx6bSGbuV9gzjVO4aQOJZXdc1xtax6TP8Lgm5VbFMCWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iGFCx4jY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so53100441fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732023752; x=1732628552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxTd0GfBmh3i01vQfBlnFQeJy3KVlNl007+6gdWBavs=;
        b=iGFCx4jYFFNC/geeYCRsMMDK2qgtiAs4CWThCdfJuwgHBLI8wVDqOM9sQe4YgBNS27
         v1KBdJnPTKJcmgZ9nActyJ1diBfoob1LtskS+AtqKrwpSTaZtohb1Nk1ecuB0iHA11yC
         SklvFCsE3mtb4VjNQYFqxqcF1sDIuU/ruCScraQkQ3VClMkggiY8NqbHOxO+gNbWPJSe
         FTvOa9guIPmRk0+I1Dqy6GJap5WtW6fUnbf4fQxRPZdAnjWBSJlG9GVhqnp+UqZJ06mo
         Q0NyidIABscJtXTnZFso74su6Ueb28OCBuDKhcmuhCvtQOTU3mo9QwbDqSKaPdv0YDJ1
         r7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732023752; x=1732628552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxTd0GfBmh3i01vQfBlnFQeJy3KVlNl007+6gdWBavs=;
        b=cQFSalA3JgTJvxM6a69MnPT6J1C2BjpcDOtGBtW69SF7NRQ7qq1RJ77DtYaSAx7SDX
         zo4pW6P8tEIkWA3+iZgKnu0VM+zbvTPbsXJ4w1ueHP6uj57nuFAhvzmelrRGGW2/OfUa
         vVVDrLPUjLIflYtuTBBeldP/V671ZqQgpw3lV3hTCCmfwIUF14TIUuGdAw2QvkQqq8jU
         SRlAmSZnND++V0coLqJnFMmxkHUEPlrZYnU7rgKSuboyR2bw3OLQ7uFL30wcZoWVKPls
         GAJdhzIlS7kZ4a9EYfis7pugvfMDdN/d2bJFIDTnwgbs43ealOyeax69R43TvXX0sIVm
         YsZA==
X-Gm-Message-State: AOJu0YzEd4Wn+0cjxPjhhfaTXp1d+SN56gTZGKfH4WxxZ2cRH5OkD8yo
	9/D8I8uIPDaJI6w05CyvSv98S0a/wAmD9U4vEw+jf1GW4BlI6filXviqAVmCJjKA/k08b3r76kr
	wWWyjynfqEJvMVjHKBsdHE2kxLd6KxObEI8nf1Ts/MrtseraP
X-Google-Smtp-Source: AGHT+IGzymcUVlBdKlTtFZK2lv6S5szAbR7R8PFj3dTv1qOPDqLtXvJ6LfY3nk1sF5TtnzHU58ypcFim3x8Jr6fwTI8=
X-Received: by 2002:a05:651c:906:b0:2fb:5c20:43e0 with SMTP id
 38308e7fff4ca-2ff6062c366mr60372841fa.15.1732023751878; Tue, 19 Nov 2024
 05:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145116.2123714-1-vfazio@xes-inc.com> <20241114145116.2123714-19-vfazio@xes-inc.com>
In-Reply-To: <20241114145116.2123714-19-vfazio@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Nov 2024 14:42:21 +0100
Message-ID: <CAMRc=Mewh68d=2DmfDhMzWK6tPBFoqVLmdHqRWa9iNAzGjbTow@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 18/23] bindings: python: tests: add type
 stubs for external modules
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 3:51=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Add type stubs for the compiled external modules so that types and
> methods used from the modules are accurately type checked.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/tests/gpiosim/_ext.pyi  | 21 +++++++++++++++++++++
>  bindings/python/tests/procname/_ext.pyi |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 bindings/python/tests/gpiosim/_ext.pyi
>  create mode 100644 bindings/python/tests/procname/_ext.pyi
>
> diff --git a/bindings/python/tests/gpiosim/_ext.pyi b/bindings/python/tes=
ts/gpiosim/_ext.pyi
> new file mode 100644
> index 0000000..69d4b63
> --- /dev/null
> +++ b/bindings/python/tests/gpiosim/_ext.pyi
> @@ -0,0 +1,21 @@
> +class Chip:
> +    def __init__(self) -> None: ...
> +    def set_label(self, label: str) -> None: ...
> +    def set_num_lines(self, num_lines: int) -> None: ...
> +    def set_line_name(self, offset: int, name: str) -> None: ...
> +    def set_hog(self, offset: int, name: str, direction: int) -> None: .=
..
> +    def enable(self) -> None: ...
> +    def get_value(set, offset: int) -> int: ...
> +    def set_pull(set, offset: int, pull: int) -> None: ...
> +    @property
> +    def dev_path(self) -> str: ...
> +    @property
> +    def name(self) -> str: ...
> +
> +PULL_DOWN: int
> +PULL_UP: int
> +VALUE_INACTIVE: int
> +VALUE_ACTIVE: int
> +DIRECTION_INPUT: int
> +DIRECTION_OUTPUT_HIGH: int
> +DIRECTION_OUTPUT_LOW: int
> diff --git a/bindings/python/tests/procname/_ext.pyi b/bindings/python/te=
sts/procname/_ext.pyi
> new file mode 100644
> index 0000000..fdcd8ac
> --- /dev/null
> +++ b/bindings/python/tests/procname/_ext.pyi
> @@ -0,0 +1 @@
> +def set_process_name(name: str) -> None: ...
> --
> 2.34.1
>
>

This is missing the SPDX identifiers and makes `reuse lint` complain. :(

However everything else looks awesome and I don't have other issues.
Can I just use the same SPDX tags you used in other .pyi files in this
series when applying?

Bart

