Return-Path: <linux-gpio+bounces-25598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54EEB43E60
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 16:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0264C1723E7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 14:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B941DB551;
	Thu,  4 Sep 2025 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uu/qWsGW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE14C4A3C
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995409; cv=none; b=JEN/hdANi/n8yKjCKVzxliw29sfxF4WOMcrx1tvfwEavQqmAp4bYbII/rjAFl2OVoL1cZR1gmG5N3W8L/sboj7SHKL9bynuemEcujijXuE8c3hkniev7xR+8s8CL9yCtrSiE3EZm+8zFR139fAtujzvyAZn0l9kSwtbr1UFh6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995409; c=relaxed/simple;
	bh=JwV04hKFmbyS+3NDSK88Q1Wbt+MKPv9rilyBNuvNZXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxNsdGnXbGQ1+1OVNanSn1N2J30babYlRmxgGYypp7LfQHuW63i/zXaqt86EERGkoowYZ+zGw2/Mgl2dKXzlSsJ99FVatBJMQzGpXUzXuDvpnklxLhYOY+mU1gPjz15P7xudPX/5HJCs5Xbdz18hmDFKhAlsfMA0KCCtDKiaqL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uu/qWsGW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so1149288e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756995405; x=1757600205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFGd6yWf/KQmHBHjqqMueKykFoFxhjOQsRLPpV7p/4k=;
        b=uu/qWsGWN6+nbk+q3Q3dSWo1HdD/3rcXZx36JK3SuYSvdcqICxJDiiJLRRV/jrVwEH
         XfuMus0o1ulqGldf3+Euw0uVQetwTCYyZQ8DCHU6zTvqzhTXBF23MNu3C+cdow3BAruw
         uIkhk9eGEUfD2md/QNDfZG47icnR07UEQl3r7TKXjsuEABI8iFP0tyDMhSUZbCeX2G7G
         crAXHmeUTtL/L3G4ZUuGqejWEwcRrv80lUwkcvxlA8sb3SQKPusNr5afMdo12uhA9k7l
         /QRvOYjpOhKyYwIKJFCf9QFLQFubK31O3aVwwY713sn59sqOfryxPIYz0zp89piVHUjW
         FHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995405; x=1757600205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFGd6yWf/KQmHBHjqqMueKykFoFxhjOQsRLPpV7p/4k=;
        b=MlYVwfe7/mxiMnqiTIGrwFPSgiMcyrlFSw+84PrNx4HP3vaO+j4NgeHguw9iT59RJg
         Jo0RPwG2CB09UF6K01Plxm84Ch0osVKoJ3cMu3b4Jqx8OAnDvWBw64c+ivKPAM/1AuOP
         02crL7Y+yRy9/tICjI3Ckpg0p+sAYc+z4qzJfMFHWa1PFj636aGExbkpwDMPuPTLHpc/
         1b/SINIFOODtpbmaqfLaHYI6Y24cKH1wD1k3z/CxAZTRPO/3U/nuOCYYSyfIyDYgxbzM
         MCZjKuDeVF4V6m7xcEg98hBNl//3bZyFPQnRS5bZet7sA2rGXJQQ3PZ88rsGCmVUjrNu
         rlwg==
X-Gm-Message-State: AOJu0YyJMD9ltMZ1zrFIEL9CWnF6CuLZPH4ZdNK9Mxjo+iS4Xb//xxTu
	sSgut7nqibT2Ql9YGxcyZC700OZe/mREEaihKuc0GO4/VWCW65q+CZJoMahhs40BmujQuxzkcb7
	nyeaHZhEt+6AMk85WLtlGkasojufFjvbAf8rQ5DtqXg==
X-Gm-Gg: ASbGncshOClH8Re9bGysbTtdfrZCeW7stTYMLAic4IJzZqRwdSxRYy82CZ2U7ACbvOr
	fbdhFUVot8EoUQUXkWiZ/2XGoPcISlhdEtBcGlVdFIvN/4Js26lC4vWYCdJKvQok3KKaHHGycSp
	dtib/OhkdSzy8MKapkKnuOlRO+rh1d5XNjNJ/YvIrE4he120M5rUSMcq+JkX9qPAyKtKeIjS5I2
	f7cO5OIgaRUSDWaUYLUMmkcg9MN/P2q6/ICgA==
X-Google-Smtp-Source: AGHT+IG4EqGvnCR8T5E/0dYuzu59ZPHNqNl6klnMrMvAPebadG4kWsbK/bvj7vlAqWYOZc7Vfbar4hkj3JiQtwYK0Ak=
X-Received: by 2002:a05:6512:3da4:b0:560:956e:4392 with SMTP id
 2adb3069b0e04-560956e49bcmr677990e87.9.1756995404652; Thu, 04 Sep 2025
 07:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902123905.6491-1-vfazio@gmail.com>
In-Reply-To: <20250902123905.6491-1-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 4 Sep 2025 16:16:33 +0200
X-Gm-Features: Ac12FXyk2dD0cC739387ln7Q02R0uwMRGA3I9gOodbQI52j2HckWwCBql263eKs
Message-ID: <CAMRc=McdCY5q9+DGBqCCL7kYAF69q0n43G4yF3=g18VBawO9tA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: parse non-tuple Iterable keys
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 2:40=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wro=
te:
>
> When `chip.request_lines` was modified to allow `Iterable`s instead of
> only `tuple`s, the code that checked for duplicate line entries in the
> `config` argument was not updated to account for the expanded types.
>
> If the `config` argument had a key that was not a `tuple`, `str`, or
> `int`, a `TypeError` would be raised when resolving the line offset.
>
> Refactor the code the resolves IDs to offsets into a separate function
> to make the logic a bit clearer and to account for the widened types.
>
> Fixes: 8f62e6c45355 ("bindings: python: loosen type requirements in publi=
c API")
> Closes: https://github.com/brgl/libgpiod/issues/148
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  bindings/python/gpiod/chip.py               | 23 ++++++++++++++-------
>  bindings/python/tests/tests_line_request.py |  4 ++++
>  2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.p=
y
> index 5641343..cccfb03 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -236,6 +236,20 @@ class Chip:
>          self._check_closed()
>          return cast(_ext.Chip, self._chip).read_info_event()
>
> +    def _resolve_config_keys_to_offsets(
> +        self,
> +        config_keys: Iterable[Union[Iterable[Union[int, str]], int, str]=
],
> +    ) -> list[int]:
> +        offsets: list[int] =3D list()
> +        for key in config_keys:
> +            # perform strict int/str check since str is also Iterable
> +            if isinstance(key, (int, str)):
> +                offsets.append(self.line_offset_from_id(key))
> +            else:  # key is an iterable with multiple IDs to resolve
> +                for item in key:
> +                    offsets.append(self.line_offset_from_id(item))
> +        return offsets
> +
>      def request_lines(
>          self,
>          config: dict[
> @@ -271,14 +285,7 @@ class Chip:
>
>          # Sanitize lines - don't allow offset repetitions or offset-name=
 conflicts.
>          for offset, count in Counter(
> -            [
> -                self.line_offset_from_id(line)
> -                for line in (
> -                    lambda t: [
> -                        j for i in (t) for j in (i if isinstance(i, tupl=
e) else (i,))
> -                    ]
> -                )(tuple(config.keys()))
> -            ]
> +            self._resolve_config_keys_to_offsets(config_keys=3Dconfig.ke=
ys())

This looks good, just a quick question: is there any particular reason
to use a named argument here? Looks like a positional parameter would
work just fine and stay pretty clear as the method only takes one.

Bart

>          ).items():
>              if count !=3D 1:
>                  raise ValueError(
> diff --git a/bindings/python/tests/tests_line_request.py b/bindings/pytho=
n/tests/tests_line_request.py
> index afee644..217c299 100644
> --- a/bindings/python/tests/tests_line_request.py
> +++ b/bindings/python/tests/tests_line_request.py
> @@ -101,6 +101,10 @@ class ChipLineRequestWorks(TestCase):
>          with self.chip.request_lines(config=3D{(4): None}) as req:
>              self.assertEqual(req.offsets, [4])
>
> +    def test_request_single_offset_as_frozenset(self) -> None:
> +        with self.chip.request_lines(config=3D{frozenset([4]): None}) as=
 req:
> +            self.assertEqual(req.offsets, [4])
> +
>      def test_request_by_name(self) -> None:
>          with self.chip.request_lines(config=3D{(1, 2, "foo", "bar"): Non=
e}) as req:
>              self.assertEqual(req.offsets, [1, 2, 5, 7])
> --
> 2.43.0
>
>

