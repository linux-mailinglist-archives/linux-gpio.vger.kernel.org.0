Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964D8709C8B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 May 2023 18:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjESQiR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 12:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjESQiQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 12:38:16 -0400
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1081C9;
        Fri, 19 May 2023 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
        ; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:Mime-Version:
        References:In-Reply-To:Message-Id:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=76cJ0skIhyy+1lAVyE9zLl1oSMyjfPpd1OdLSw6ObVk=; b=kKMsTSMkgH22P7SpQbWgBIhDYc
        fvaUobOsWFVP5k+E42KOXobO6mUqqHSX1Et1ejNHolG3i3qoTj0rat96vNQW4O9zefv/U09WLC2HB
        SbRwMOswx29sNJfsiDVLABVRebjXVfWRnMr6Dfb8oxZrHVd/guvAKp1SxzVLQwyqERng=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:55206 helo=pettiford)
        by mail.hugovil.com with esmtpa (Exim 4.92)
        (envelope-from <hugo@hugovil.com>)
        id 1q037B-000584-Fq; Fri, 19 May 2023 12:38:02 -0400
Date:   Fri, 19 May 2023 12:38:01 -0400
From:   Hugo Villeneuve <hugo@hugovil.com>
To:     Lech Perczak <lech.perczak@camlingroup.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Lech Perczak <l.perczak@camlintechnologies.com>,
        Tomasz =?UTF-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>,
        linux-gpio@vger.kernel.org,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <20230519123801.e1123cab701b6cb0ffbf367f@hugovil.com>
In-Reply-To: <849ac3f6-82e6-fb9e-a693-b78edd3e5f2b@camlingroup.com>
References: <20230518132905.4182265-1-hugo@hugovil.com>
        <20230518132905.4182265-2-hugo@hugovil.com>
        <3a8cf0e2-b11c-d2f3-081e-a43bdad66224@camlingroup.com>
        <20230519093031.9c35c8ee5387e1fc4bdf79f1@hugovil.com>
        <849ac3f6-82e6-fb9e-a693-b78edd3e5f2b@camlingroup.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
Subject: Re: [RFC PATCH v2 2/2] serial: sc16is7xx: fix regression with GPIO
 configuration
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 May 2023 18:00:54 +0200
Lech Perczak <lech.perczak@camlingroup.com> wrote:

>=20
> W dniu 19.05.2023 o=A015:30, Hugo Villeneuve pisze:
> > On Fri, 19 May 2023 15:00:58 +0200
> > Lech Perczak <lech.perczak@camlingroup.com> wrote:
> >
> >> Hello Hugo,
> >>
> >> A couple of remarks inline.
> >>
> >> W dniu 18.05.2023 o 15:29, Hugo Villeneuve pisze:
> >>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>>
> >>> Commit 679875d1d880 ("sc16is7xx: Separate GPIOs from modem control li=
nes")
> >>> and commit 21144bab4f11 ("sc16is7xx: Handle modem status lines")
> >>> changed the function of the GPIOs pins to act as modem control
> >>> lines without any possibility of selecting GPIO function.
> >>>
> >>> As a consequence, applications that depends on GPIO lines configured
> >>> by default as GPIO pins no longer work as expected.
> >>>
> >>> Also, the change to select modem control lines function was done only
> >>> for channel A of dual UART variants (752/762). This was not documented
> >>> in the log message.
> >>>
> >>> This new patch allows to specify GPIO or modem control line function
> >>> in the device tree, and for each of the ports (A or B).
> >>>
> >>> This is done by using the new device-tree property named
> >>> "modem-control-line-ports" (property added in separate patch).
> >>>
> >>> Boards that need to have GPIOS configured as modem control lines
> >>> should add that property to their device tree. Here is a list of
> >>> boards using the sc16is7xx driver in their device tree and that may
> >>> need to be modified:
> >>>     arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> >>>     mips/boot/dts/ingenic/cu1830-neo.dts
> >>>     mips/boot/dts/ingenic/cu1000-neo.dts
> >>>
> >>> Fixes: 679875d1d880 ("sc16is7xx: Separate GPIOs from modem control li=
nes")
> >>> Fixes: 21144bab4f11 ("sc16is7xx: Handle modem status lines")
> >>> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>> ---
> >>> v1 -> v2: Rebase because original patch did not apply properly
> >>>           Add git base-commit
> >>>
> >>>  drivers/tty/serial/sc16is7xx.c | 42 ++++++++++++++++++++------------=
--
> >>>  1 file changed, 25 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16=
is7xx.c
> >>> index abad091baeea..4e3d2325ef6e 100644
> >>> --- a/drivers/tty/serial/sc16is7xx.c
> >>> +++ b/drivers/tty/serial/sc16is7xx.c
> >>> @@ -236,7 +236,8 @@
> >>>
> >>>  /* IOControl register bits (Only 750/760) */
> >>>  #define SC16IS7XX_IOCONTROL_LATCH_BIT  (1 << 0) /* Enable input latc=
hing */
> >>> -#define SC16IS7XX_IOCONTROL_MODEM_BIT  (1 << 1) /* Enable GPIO[7:4] =
as modem pins */
> >>> +#define SC16IS7XX_IOCONTROL_MODEM_A_BIT        (1 << 1) /* Enable GP=
IO[7:4] as modem A pins */
> >>> +#define SC16IS7XX_IOCONTROL_MODEM_B_BIT        (1 << 2) /* Enable GP=
IO[3:0] as modem B pins */
> >>>  #define SC16IS7XX_IOCONTROL_SRESET_BIT (1 << 3) /* Software Reset */
> >>>
> >>>  /* EFCR register bits */
> >>> @@ -306,7 +307,6 @@ struct sc16is7xx_devtype {
> >>>         char    name[10];
> >>>         int     nr_gpio;
> >>>         int     nr_uart;
> >>> -       int     has_mctrl;
> >>>  };
> >>>
> >>>  #define SC16IS7XX_RECONF_MD            (1 << 0)
> >>> @@ -447,35 +447,30 @@ static const struct sc16is7xx_devtype sc16is74x=
_devtype =3D {
> >>>         .name           =3D "SC16IS74X",
> >>>         .nr_gpio        =3D 0,
> >>>         .nr_uart        =3D 1,
> >>> -       .has_mctrl      =3D 0,
> >>>  };
> >>>
> >>>  static const struct sc16is7xx_devtype sc16is750_devtype =3D {
> >>>         .name           =3D "SC16IS750",
> >>> -       .nr_gpio        =3D 4,
> >>> +       .nr_gpio        =3D 8,
> >>>         .nr_uart        =3D 1,
> >>> -       .has_mctrl      =3D 1,
> >>>  };
> >>>
> >>>  static const struct sc16is7xx_devtype sc16is752_devtype =3D {
> >>>         .name           =3D "SC16IS752",
> >>> -       .nr_gpio        =3D 0,
> >>> +       .nr_gpio        =3D 8,
> >>>         .nr_uart        =3D 2,
> >>> -       .has_mctrl      =3D 1,
> >>>  };
> >>>
> >>>  static const struct sc16is7xx_devtype sc16is760_devtype =3D {
> >>>         .name           =3D "SC16IS760",
> >>> -       .nr_gpio        =3D 4,
> >>> +       .nr_gpio        =3D 8,
> >>>         .nr_uart        =3D 1,
> >>> -       .has_mctrl      =3D 1,
> >>>  };
> >>>
> >>>  static const struct sc16is7xx_devtype sc16is762_devtype =3D {
> >>>         .name           =3D "SC16IS762",
> >>> -       .nr_gpio        =3D 0,
> >>> +       .nr_gpio        =3D 8,
> >>>         .nr_uart        =3D 2,
> >>> -       .has_mctrl      =3D 1,
> >>>  };
> >>>
> >>>  static bool sc16is7xx_regmap_volatile(struct device *dev, unsigned i=
nt reg)
> >>> @@ -1456,12 +1451,6 @@ static int sc16is7xx_probe(struct device *dev,
> >>>                                      SC16IS7XX_EFCR_RXDISABLE_BIT |
> >>>                                      SC16IS7XX_EFCR_TXDISABLE_BIT);
> >>>
> >>> -               /* Use GPIO lines as modem status registers */
> >>> -               if (devtype->has_mctrl)
> >>> -                       sc16is7xx_port_write(&s->p[i].port,
> >>> -                                            SC16IS7XX_IOCONTROL_REG,
> >>> -                                            SC16IS7XX_IOCONTROL_MODE=
M_BIT);
> >>> -
> >>>                 /* Initialize kthread work structs */
> >>>                 kthread_init_work(&s->p[i].tx_work, sc16is7xx_tx_proc=
);
> >>>                 kthread_init_work(&s->p[i].reg_work, sc16is7xx_reg_pr=
oc);
> >>> @@ -1497,6 +1486,25 @@ static int sc16is7xx_probe(struct device *dev,
> >>>                                          prop, p, u)
> >>>                         if (u < devtype->nr_uart)
> >>>                                 s->p[u].irda_mode =3D true;
> >>> +
> >>> +               val =3D 0;
> >>> +
> >>> +               of_property_for_each_u32(dev->of_node, "nxp,modem-con=
trol-line-ports",
> >>> +                                        prop, p, u)
> >> The general idea looks solid to me.
> >> I think, that with this property set, we should also reduce number of =
GPIOs exported by gpiochip.
> > OK, I will look into that.
> >
> >>> +                       if (u < devtype->nr_uart) {
> >>> +                               /* Use GPIO lines as modem control li=
nes */
> >>> +                               if (u =3D=3D 0)
> >>> +                                       val |=3D SC16IS7XX_IOCONTROL_=
MODEM_A_BIT;
> >>> +                               else if (u =3D=3D 1)
> >>> +                                       val |=3D SC16IS7XX_IOCONTROL_=
MODEM_B_BIT;
> >>> +                       }
> >>> +
> >>> +               if (val)
> >>> +                       regmap_update_bits(
> >>> +                               s->regmap,
> >>> +                               SC16IS7XX_IOCONTROL_REG << SC16IS7XX_=
REG_SHIFT,
> >>> +                               SC16IS7XX_IOCONTROL_MODEM_A_BIT |
> >>> +                               SC16IS7XX_IOCONTROL_MODEM_B_BIT, val);
> >> I just had a chance to test this on my hardware (with SC16IS760), and =
something still doesn't work.
> >> When looking into /sys/kernel/debug/regmap/<device>/registers,
> >> it seems like the proper bits are set, also taking the regmap shift in=
to account.
> >> For reference - I did my test basing on v6.4-rc2.
> >>
> >> I used a loopback plug and statserial to perform the test.
> >> Without your patch, when DTR is set, all other pins (DCD, DSR, RI) are=
 set. With it - they are cleared, according to statserial.
> > It is strange, because the only conceptual change is the moment in time=
 when we set the IOControl register. Before, IOControl was set within the f=
or/loop for initializing each port. Now it is done after.
> >
> > Maybe you could try to put the section that reads the DT property just =
after resetting the device.
> >
> > While suggesting this, I just noticed that when the device is reset, we=
 do not wait before initiating communication with the device. Thefore, I wo=
uld suggest the following change (that I will submit as a separate patch):
> >
> >         regmap_write(s->regmap, SC16IS7XX_IOCONTROL_REG << SC16IS7XX_RE=
G_SHIFT,
> >                         SC16IS7XX_IOCONTROL_SRESET_BIT);
> >
> > +       /* After reset, the host must wait at least 3us before initiali=
zing a
> > +        * communication with the device: */
> > +       usleep_range(3, 5);
> >
> > Then like I said, insert the code that read the modem-control-line-port=
 DT property right after that to see if it helps.
> >
> > Hugo.
>=20
> Hello,
>=20
> I tried those suggestions, together with the patch you mentioned in the o=
ther email - all to no avail.
> I added a debug print to confirm, that the property is detected, and regm=
ap access is executed - and it is. This is so strange.
> Maybe the offsets in regmap are still wrong, for some reason?
> I also double checked if it was possible to alter and check GPIO states t=
hrough GPIO subsystem - it is.

Then it seems that the remaining difference is the number of GPIOs that are=
 configured, which for the moment is always the value set in constant nr_gp=
io (for each device).

I already implemented and tested your suggestion of lowering the number of =
GPIOs exported when using some pins as modem status lines. It seems to be w=
orking good, altough I have only tested that the correct number of GPIOs ar=
e now exported.

I will send you the test patch and let me know if it helps.

Hugo.
