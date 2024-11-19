Return-Path: <linux-gpio+bounces-13103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ADA9D2749
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C29A284C12
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 13:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644091CDA1C;
	Tue, 19 Nov 2024 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU7L3AyT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B311C1C4A28;
	Tue, 19 Nov 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732024243; cv=none; b=KNRZLVy0GfVGYFIWpZRbTdZzthT3pnJTCkEeC5y4pHV38Zcnw0LGCq1R8wkCLAFDk3HtG/ylsUR5vBGlahhOyPandkZXftp4DXgjZjsgLavTpt9w+PJddyQ4XuQYSsADV9qeqlqVP3VpzV6sg02OloRZl+1N/W02jrpa3Feh4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732024243; c=relaxed/simple;
	bh=O+2yaWE7MrY0hAbm6RSLIF6P8HDec6BOFm3Kn1pxwQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrNlVg6T6ZkqRViPKTmDLOqNUWbPaDiBYqDL2AZOr2EZkKCMftIwlSB+1z01ZYmahvv+yhRWB/bY+9cpPiq2Ld1DVOGMXf8672ieSNNmci7spMSGSSU+OaoZTbLjld+kFXmbmaYn4pL1bpSnbdGTRfBBw4kK+WirYFIa+h0uQDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KU7L3AyT; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6eeb66727e7so3271997b3.2;
        Tue, 19 Nov 2024 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732024240; x=1732629040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+2yaWE7MrY0hAbm6RSLIF6P8HDec6BOFm3Kn1pxwQ8=;
        b=KU7L3AyTu+ROBnaWbv2DMtB4x8s5omgdJ61aKiQvH89LnR1eE0+z56wRmwl0BnR7Vl
         6JzqyrzuZWVSLZFA7AJPp//h5WkqLgohafnUC6dDAHNLTSLQm7yklf4jdL8EuNpzl9/D
         nyJbD2DTcu78r2v8QFkIu6TrWgIxhcte0t5L2yWWKK08SxxwLE/HlF+7PZLJK5YtT/hi
         YGd35b3bL0JCUI3C/3nSQiT0QjWw28KFnL5KWnvhpUBbRJxe+ONnF/Fau6Al3zCzEJ03
         5jWM/fia99BFpGYSDqWT/P5cyYXHhozwEBHBA5IYn5KRfLsVAkQTJRrTPsz5HLRuRJz/
         ECmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732024240; x=1732629040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+2yaWE7MrY0hAbm6RSLIF6P8HDec6BOFm3Kn1pxwQ8=;
        b=dtKF6XV8qpKrOtDKLox4i0Je8w6VfGoft48zNbjSjuNaB2MSgCt3fIVP+OEisTAO1O
         GE8LNYh39XYFeYDbhPJYRuWz5cFTxEHgZzpIB/uOA5Iy8Ys+iVKMVw/XtoEtcqrzFhn0
         0nZ4y9cIIjeo1sMjtZqGoRGRlfCfdGBupQ/a/VB3K8AI8TPkYzs0ZpZLVJrWp/S6/YsS
         lTTF6Ks9qunou3QMH84xu0dPjAZmiUPfWIT1Axlf+Jz5nezP6CRZmwivzPZYO8GnCgWD
         cuG+rEVEJJUjAlZgsVr4KTViAHlEClO/WrK/szBbXAl021tZ9jS7WaGD5v7/tIlWmJ4a
         NLAw==
X-Forwarded-Encrypted: i=1; AJvYcCUPy1EsjZjcupMlCIAOopKa672dvU+5+8v4w8nIYaEUHpS8ohoEHBuwN5Ue1FmNkMVGDST8oxsd@vger.kernel.org, AJvYcCVrF+VWXoFOZuEQrQoosgMf2irNDHvpu6YQuQYaYQCeaay+VFHPCv9E8y0o7xZOekVrCjFTO9K8Snqb@vger.kernel.org
X-Gm-Message-State: AOJu0YwAv7szeRIRHKUJgTBqsu74Q5KEU4p6p1HhqNNssTEVHpj4Te+0
	fSqfxaO0+vf1OGHGVkatE/3D2pWEqXS/Ldz49rJABZhW9PJ6hrQkj9/izvNQsl72PyAKKh3qHzz
	3w4QMU+SgNPC4YFuM3KEPYlddkGdZJDqR
X-Google-Smtp-Source: AGHT+IEnjUXISR+k4UUPJm48i01H3L9JOOKgFtZw1NvIyvaQ3rtpjlow50haeyfW0zsWpvebBgMN/T6lv3GM+Zt32nk=
X-Received: by 2002:a05:690c:7307:b0:6ea:8ebb:1f9e with SMTP id
 00721157ae682-6ee55c57eb7mr166850177b3.36.1732024240669; Tue, 19 Nov 2024
 05:50:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZykY251SaLeksh9T@smile.fi.intel.com> <20241105071523.2372032-1-skmr537@gmail.com>
 <ZyouKu8_vfFs20CB@smile.fi.intel.com> <ZzN0nn6WFw2J8HTF@smile.fi.intel.com>
 <CAMRc=Md=tv6QapMCoiLf6eeK9qOtG1jvENHnKdTk2i6U+=8p5A@mail.gmail.com> <Zzs0cc2F4vkGhqCQ@smile.fi.intel.com>
In-Reply-To: <Zzs0cc2F4vkGhqCQ@smile.fi.intel.com>
From: sai kumar <skmr537@gmail.com>
Date: Tue, 19 Nov 2024 19:20:29 +0530
Message-ID: <CAA=kqWKv0rJZwarNm6dDrEsP9EsdiJOoo5HcbMOD_0iVfA=eUQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: exar: set value when external pull-up or
 pull-down is present
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org, 
	mmcclain@noprivs.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andy and Bart.

On Mon, Nov 18, 2024 at 6:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 18, 2024 at 12:00:00PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 12, 2024 at 5:09=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Nov 05, 2024 at 04:39:38PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Nov 05, 2024 at 12:45:23PM +0530, Sai Kumar Cholleti wrote:
>
> ...
>
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Does this need to be applied, Bart?
> > > Seems it is missed in your branches...
> >
> > Maybe if the author used get_maintainers.pl as they should, I would
> > have noticed this earlier?
>
> Ah good catch!
>
> Sai, FYI, I use my script [1] which does all required stuff for me.
> Feel free to use it, patch, comment, etc...
>
> > I have some other fixes to pick up so I'll send this later in the merge=
 window.
>
> Thanks!
>
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintaine=
r.sh
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

