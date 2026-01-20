Return-Path: <linux-gpio+bounces-30767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FFD3C448
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 10:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D372D54A436
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6723DA7FE;
	Tue, 20 Jan 2026 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAxECpo7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE403EF0AB
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901777; cv=none; b=WAeLM0MKoBCZsnxkU+zNV1gLBR1PU73XvpaV8RKaE7MiCyLL1nD3MYIIbUKPagUf4cHSR5GIuqQ2BFrpnDHjF6HWfSADiZVYkjl8ETeZ+lqspTKiG37cSCV+4SqhHWlkESSX9RmUl7L42aqfLoUz0O+OV4kUWqjC7KIGMRpKX3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901777; c=relaxed/simple;
	bh=KIXhMotqXYgZs7q1xs4ZtNlVxqjmCqvHlSuxcZkkEJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdcGmQMGpat1JsshxyumtPv4SlJZN1sb6FA2DoT/kfjwhuLNk8JrlYSs3JbeoYxhV4E5ADISeOD42gqMyqef0e8B5qemQ3TQDeKhl6fNAj5i+Xp6QLxOg3dVZiSn2rC7ZdtZwkAYvijyprlg3F4ORAnq66XA4c1pwEuLCwaVS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAxECpo7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E25CC16AAE
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768901777;
	bh=KIXhMotqXYgZs7q1xs4ZtNlVxqjmCqvHlSuxcZkkEJw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZAxECpo7BNNw7K0YiW2Z09twsOXHiu3AtmhCcCoBFbH8GZdMRmdwbMwYXoaEwF6Fh
	 VKK9JxNc7eM/CuNuEkxf5XzdLctF3Svk3mE1z8JqZ+ybVI7K6bNTGxmm/eIrzTOsdY
	 hefJkurOPP8An7C3ECvxtjhFApFqJxj8hraVxwTz85RmZ7twNWxAyCF1dpghPrZLpW
	 7aykexqdM9XZczJjdR6gvQKbMn9o3APbFXG9IAVCQg6KdoMXw0w/9FhYDSF6GRFEkm
	 5W4j4fSEN9m805hBOBzRVHycqCNb7s27fp24/+kXT+HZmSMb67y2FmOcE992X7p6gE
	 3XRkW79U7pK+w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-383022729d5so39119261fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 01:36:17 -0800 (PST)
X-Gm-Message-State: AOJu0Ywu3qzlsFV233sTCLeB1U2lrxUGlqaSeLJtrIVAIvipKDXxBlSa
	BLa6hOTKgz+deyJnGIGTLZQcCmEePtoM82HYIkjUcUfVnTaUK5xtmZphHe+W2Kr3M/t6cOCklq4
	jFxkCpiyIN7rNlzOAnDTqdaQ+kS8zWRpPTJJHDziN7Q==
X-Received: by 2002:a05:6512:15a4:b0:59b:7b13:58b1 with SMTP id
 2adb3069b0e04-59dc9367216mr590995e87.52.1768901776261; Tue, 20 Jan 2026
 01:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119200031.5832-1-shaarang.tyagi@gmail.com>
In-Reply-To: <20260119200031.5832-1-shaarang.tyagi@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 20 Jan 2026 10:36:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdtRS9-kwLhe9-uJ0MT4JtkwfJucNKWhQHugNr0aMYRQw@mail.gmail.com>
X-Gm-Features: AZwV_QjMpmaAlVRFkAfvJvdGlSuOsXkKSUON9DKeLBSgqqU8a9ABSVlrk2ALer0
Message-ID: <CAMRc=MdtRS9-kwLhe9-uJ0MT4JtkwfJucNKWhQHugNr0aMYRQw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] tools: gpiomon: add initial-state option
To: shaarang.tyagi@gmail.com
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 9:01=E2=80=AFPM <shaarang.tyagi@gmail.com> wrote:
>
> From: Shaarang Tyagi <shaarang.tyagi@gmail.com>
>

Thanks, looks much better.

> Add a gpiomon initial-state command line option to display
> initial line states, this is diplayed before waiting for events.
>

Please also mention that you factor out the gpioget code into tools-common.

> Closes: https://github.com/brgl/libgpiod/issues/159
> Signed-off-by: Shaarang Tyagi <shaarang.tyagi@gmail.com>
> ---
> Changes in v2:
> - allocation of "values" moved to if block.
> - existing variable pollfds was freed.

This doesn't belong into this commit, see below.

> - option -S changed to -I.
> - Added to the unit test.

I think you forgot to mention the reuse of print_line_vals() here.

[snip]

>
> +test_gpiomon_with_initial_state() {
> +       gpiosim_chip sim0 num_lines=3D8
> +
> +       gpiosim_set_pull sim0 2 pull-up
> +       gpiosim_set_pull sim0 3 pull-up
> +       gpiosim_set_pull sim0 5 pull-up
> +       gpiosim_set_pull sim0 7 pull-up
> +
> +       local sim0=3D${GPIOSIM_CHIP_NAME[sim0]}
> +
> +       run_prog gpiomon --initial-state --chip "$sim0" 0 1 2 3 4 5 6 7
> +
> +       output_is \
> +"Initial line state(s): \"0\"=3Dinactive \"1\"=3Dinactive \"2\"=3Dactive=
 \"3\"=3Dactive \"4\"=3Dinactive \"5\"=3Dactive \"6\"=3Dinactive \"7\"=3Dac=
tive"
> +       status_is 124

You effectively wait for the timeout to kick in and accept the error
status as proper result. It also makes this test case very slow.
Please see what other gpiomon tests do and do the same - use the
dut_run and dut_kill.

[snip]

>
> @@ -445,6 +453,20 @@ int main(int argc, char **argv)
>                         die_perror("unable to request lines on chip %s",
>                                    resolver->chips[i].path);
>
> +               if (cfg.initial_state) {
> +                       values =3D calloc(resolver->num_lines, sizeof(*va=
lues));
> +                       if (!values)
> +                               die("out of memory");

Add a newline.

> +                       ret =3D gpiod_line_request_get_values(requests[i]=
, values);
> +                       if (ret)
> +                               die_perror("unable to read GPIO line valu=
es");
> +
> +                       set_line_values(resolver, i, values);
> +                       printf("Initial line state(s): ");

This is unneeded and will make parsing harder. Please drop this and
align the initial output with what gpioget does.

> +                       print_line_vals(resolver, cfg.unquoted, false);

Would it be a lot of work to also add the -N/--numeric switch like
what gpioget has here? The -N flag is free in gpiomon.

> +                       free(values);
> +               }
> +
>                 pollfds[i].fd =3D gpiod_line_request_get_fd(requests[i]);
>                 pollfds[i].events =3D POLLIN;
>                 gpiod_chip_close(chip);
> @@ -508,6 +530,7 @@ done:
>         free_line_resolver(resolver);
>         gpiod_edge_event_buffer_free(event_buffer);
>         free(offsets);
> +       free(pollfds);

This should be a separate patch with a Fixes: tag.

[snip]

With the above fixed LGTM.

Bart

