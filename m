Return-Path: <linux-gpio+bounces-12516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177FB9BB397
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C0F7B29A71
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755C01CC158;
	Mon,  4 Nov 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLIf1iSb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31A81CBEAB
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719135; cv=none; b=b9AhiwidzoPq/4v4pZA2omVEPNQmzpErSZvPGxLrBNBXeDPr/+4WJuEdk0R2+TtaM5orHgLajJuM046fIeXC9K72IaDVuc39K/iwfIgmoFOMjj3uxtCTea+nRMDCLC5Oss1XyGph/YQxsHTQI0aI3dqZ2853d1oeTbW7TTFLWvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719135; c=relaxed/simple;
	bh=RuajMNNYH2+nb9fKzlVNWFMNt1HDcJZaXabKmBKcz4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKoRAQzDWWbExwRBxFIQEew2DzfELfNOSGFrNotLmRinlzacO9se5rPWkTCoTu+Qk5AJIkQnh8nBM5bgT5VNLZ7oSd+hZQ/XsptyoX4pmDuH+2RYYACAjY6Pgpqi/jXrY/NVlkcxaJpfnNBgF53QGCnc0LVH+0CH2EmTxoYejBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLIf1iSb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ca17bf0d9so2544145ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 03:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730719133; x=1731323933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QHvx0zX+qMNAthp4bDkptm50PKK2JqbaLmKcCnsptk=;
        b=SLIf1iSbcIb812h0qsVg4toWS5TpSW49p7gzd43DTYspHi5U38QIvpqXxIgnTXHVDm
         tCMjlEZ9NFu+mZK7AR+abkZ/Z0VxtNlxs+YhDiNnWSbIqalTT4MSqBpUgd/bD4OAlIry
         J1F1ibPk6h4HUxydWxCRVHvKw/B0HZtEfSZc7rGRTOEUHs5nJr0tj/I9tn30a5FSwJne
         i/x4O380XwlWd8h6Om5FN2YxtQM0OxpHzf1fh5BFdMA++9vuYiSFyrMEqb5PNX5IzMSZ
         BOcqHsvBey/MVVSyfF3ZE0br+DcV4MkdELZAQeLgpYcwvuOGHRj9np+zJZonWPp3oYU6
         mT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730719133; x=1731323933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QHvx0zX+qMNAthp4bDkptm50PKK2JqbaLmKcCnsptk=;
        b=f1tDg+J+m4gF4K/pjmPOIEr7ZXjNyrjSHTQDxuaTrEWd8KtD3fExdqWwUfYjYq+RJD
         YAyzmAMzjUOU30cwsZ9P+2rzGmxdu7A97j7t0mjqMLXIy6oaXLMwh8RdlsnoEdcPGbwO
         B90yYgJy6hdiyC8ViiYXZYdGri9EasUZ7tHWmboit1w48rMYd8Y01gZNyZVw4wkE7OGu
         1ygXUha8WiMujdtusdSC0vYaYniByKALVdRO9oa4ThEyWTRp407o/N5dQTA3KvWiEsm7
         VCtEIVKvwHiferP1qX57UJpMYlwWzbLDUm5HpiI64XGxIyx6nJrThMbTxThHKkuwHbuq
         oPhA==
X-Gm-Message-State: AOJu0YwhUQuSkJOfNg8uE8PdKZ67E2p3FcS9XRhlKjMhhWvMzfW01jeo
	9P+gPa6BHcaiiRAxf2oqh7JCoTJziKK8v8C1mRaNqJYOkMTV3z6q3eZ5p6l7V4dWDisuIazvR1+
	xRtxcDjMWVXWy/Z/Qmg9CRBfHHOs=
X-Google-Smtp-Source: AGHT+IEFmskg1ghq7HG5dPs9PfjqNr8haNvSajefq1dQmvrTUktQumfCU+C/kYsfqCNJAw0ZIyGBX37rmwrQRxYdjQs=
X-Received: by 2002:a17:903:44d8:b0:211:327b:4b3c with SMTP id
 d9443c01a7336-211327b4d8amr47461865ad.8.1730719132851; Mon, 04 Nov 2024
 03:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030164924.3276981-1-boerge.struempfel@gmail.com> <CAMRc=McDR+hK8t+dtAc6i57_JgozkwCUmYwpTtx=heF8v13fAA@mail.gmail.com>
In-Reply-To: <CAMRc=McDR+hK8t+dtAc6i57_JgozkwCUmYwpTtx=heF8v13fAA@mail.gmail.com>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Mon, 4 Nov 2024 12:18:40 +0100
Message-ID: <CAEktqctbreLjq2fh27vW8YSob_ooQTDFCFda6HHmxbS8AQ0exA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] dbus: manager: fix linker not finding libgpiod.so
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Boerge Struempfel <bstruempfel@ultratronik.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bart,

thank you for your reply.

you are in fact correct and the LDADD is enough. There seems to be an
issue with the sdk I was using. After manually crosscompiling using a
different sdk, I no longer get the error that libgpiod.so can not be
found by the linker.

The sdk with which I got the error was generated using buildroot version
2024.01. However the error does not occur on the current buildroot
master version. Therefore you can ignore this patch.

Kind Regards,
Boerge

On Mon, Nov 4, 2024 at 10:39=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Oct 30, 2024 at 5:49=E2=80=AFPM Boerge Struempfel
> <boerge.struempfel@gmail.com> wrote:
> >
> > When crosscompiling, the linker isn't finding libpgiod.so while linking
> > the manager to libgpiod-glib.so.
> >
> > In order to fix this issue, we manually force the linker to look in
> > the corresponding folder for needed shared libraries, when building the
> > manager.
> >
> > Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
> > ---
> >  dbus/manager/Makefile.am | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/dbus/manager/Makefile.am b/dbus/manager/Makefile.am
> > index d1cef8e..32c9e30 100644
> > --- a/dbus/manager/Makefile.am
> > +++ b/dbus/manager/Makefile.am
> > @@ -9,6 +9,7 @@ AM_CFLAGS +=3D -DG_LOG_DOMAIN=3D\"gpio-manager\"
> >  AM_CFLAGS +=3D $(PROFILING_CFLAGS)
> >  AM_LDFLAGS =3D $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GUDEV_LIBS)
> >  AM_LDFLAGS +=3D $(PROFILING_LDFLAGS)
> > +AM_LDFLAGS +=3D -Wl,-rpath,$(top_builddir)/lib/.libs
> >  LDADD =3D $(top_builddir)/bindings/glib/libgpiod-glib.la
> >  LDADD +=3D $(top_builddir)/dbus/lib/libgpiodbus.la
> >
> > --
> > 2.43.0
> >
> >
>
> Can you give me more info on your environment? I'm cross-compiling
> just fine and the:
>
> LDADD +=3D $(top_builddir)/dbus/lib/libgpiodbus.la
>
> bit should be enough for linking.
>
> Bart

