Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E23CC343
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 21:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfJDTF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 15:05:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59670 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfJDTF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 15:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QGZliJPdlDlOK0+RDUjxm98who5ohoRGUY2ZZORyQ20=; b=qNkouME7U+pyHYhrMM3I2Nag1
        93AClDEkSBtJlN/W502nuojhXI4S7ERF7b65ZLm8kBIVDNH3GMfRHjqB50JDGPy7Z3ey2ddW5hkUk
        aiRXq5gfNxXAc7DzZgAioYE4gwCQkkM2leNt6wWsTk0l6h9/+iXsoUI+++OpCUnmLeTxP/6aJG4vr
        R2DI77bcMEJpb2g0iK49FwrIwL6rBZUUZPvun/8QEv1jT6MADJq+snKCty7O1kjnre1pIidqnjGMt
        EU8NJbiGZG6K/SjKymQCy0gGLdS5hT+goIR8uWz+5jvSpm0+fqVniBmVUjEeC45Cz2QsCRaj7Xu8k
        CSFWmHHSw==;
Received: from 179.187.109.114.dynamic.adsl.gvt.net.br ([179.187.109.114] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iGStm-0004nf-Cf; Fri, 04 Oct 2019 19:05:54 +0000
Date:   Fri, 4 Oct 2019 16:05:48 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     Michael =?UTF-8?B?QsO8c2No?= <m@bues.ch>,
        linux-gpio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: driver-api: bt8xxgpio: Revive dead link
Message-ID: <20191004160548.2250de01@coco.lan>
In-Reply-To: <20191004191417.09088c38@wiggum>
References: <20191004164059.10397-1-j.neuschaefer@gmx.net>
        <20191004164059.10397-2-j.neuschaefer@gmx.net>
        <20191004191417.09088c38@wiggum>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Em Fri, 4 Oct 2019 19:14:17 +0200
Michael B=C3=BCsch <m@bues.ch> escreveu:

> On Fri,  4 Oct 2019 18:40:56 +0200
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> wrote:
>=20
> > www.bu3sch.de has been unusable for several years, but the same
> > information is available on bues.ch.
> >=20
> > Cc: Michael Buesch <m@bues.ch>
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
> >  Documentation/driver-api/gpio/bt8xxgpio.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/driver-api/gpio/bt8xxgpio.rst b/Documentatio=
n/driver-api/gpio/bt8xxgpio.rst
> > index a845feb074de..d7e75f1234e7 100644
> > --- a/Documentation/driver-api/gpio/bt8xxgpio.rst
> > +++ b/Documentation/driver-api/gpio/bt8xxgpio.rst
> > @@ -2,7 +2,7 @@
> >  A driver for a selfmade cheap BT8xx based PCI GPIO-card (bt8xxgpio)
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > -For advanced documentation, see http://www.bu3sch.de/btgpio.php
> > +For advanced documentation, see https://bues.ch/cms/unmaintained/btgpi=
o.html
> >=20
> >  A generic digital 24-port PCI GPIO card can be built out of an ordinary
> >  Brooktree bt848, bt849, bt878 or bt879 based analog TV tuner card. The
> > --
> > 2.20.1
> >=20
> >  =20
>=20
> For both patches:
> Acked-by: Michael B=C3=BCsch <m@bues.ch>

Hi Jonathan,

Those drivers don't really belong to the media subsystem (although they are
for a media device), so you don't need my ack. Yet, both patches look
good to me, so, for both:

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

>=20
> If you want, you can use the short-URL:
> https://bues.ch/u/btgpio
>=20



Thanks,
Mauro
