Return-Path: <linux-gpio+bounces-843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E924800EAB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31F00281BCC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 15:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472124AF86;
	Fri,  1 Dec 2023 15:36:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBE51B2;
	Fri,  1 Dec 2023 07:36:52 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5d3d5b10197so13329497b3.2;
        Fri, 01 Dec 2023 07:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701445012; x=1702049812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UV5Mpe2cpSWdbqOG1++lkTk70fwQykmNN2hXvOVom0=;
        b=YpNsaaEkTKiJqnC0KmEd8Jo2mC+Bu2i0qEQzNkvoXNWBQKWowhKE6gaeb991D0OtqV
         SVlD7uMqw+So2IFAeStxmvO+24H4r1lNf0xB3nlsDKUIISky5JgEIeBvIkrbrXZYXgeL
         ZfKc3U4+Lk8/NOzlIPtkXrFg0xc6wkXSfXtlB0qXjKZromJK1b0GFLUmIbks3XbzuCMG
         d/+KquNI/LGfjOKgCDQENhxTkIaFwSSXZudNer2WNv69fOaNT5xwMXxs7jpOGxoIRS+L
         E5iO6tlly9c1OMfmPhzocP3yUz9NCTfaz0XWwhrqU2hEJWyrdRGqp9TXyy907pX/A+Ty
         pzoA==
X-Gm-Message-State: AOJu0YzOBtlP+Yn4MysuDStUQ8KWqtU6Bj1qX1fqpoPZmziQ0fxxMNqu
	v7MvT/vYBaRt0A0phu372Cb9IeMnQsh51A==
X-Google-Smtp-Source: AGHT+IH90ZSpjcBFpWK8As4egkUF0GGiv6hK3MC47qVKASewNIIfK1QDpleOKB/Q85Az0GxxKXNpJw==
X-Received: by 2002:a0d:ccc4:0:b0:5d4:244b:9e9a with SMTP id o187-20020a0dccc4000000b005d4244b9e9amr2259159ywd.17.1701445011611;
        Fri, 01 Dec 2023 07:36:51 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id i71-20020a0ddf4a000000b005d3758fda7dsm1022205ywe.31.2023.12.01.07.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 07:36:50 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5d2c6c1ab66so24433777b3.1;
        Fri, 01 Dec 2023 07:36:50 -0800 (PST)
X-Received: by 2002:a0d:fc05:0:b0:5cb:332e:ab68 with SMTP id
 m5-20020a0dfc05000000b005cb332eab68mr26596241ywf.5.1701445010237; Fri, 01 Dec
 2023 07:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVMpKVY8WX7dbtHfgnwgePH+i9+2BAumb37sFmqccb44g@mail.gmail.com>
 <CAMuHMdVWvVtFMUe+J9R2ZU8Hi5CGs0NQfwUxitganM85183KkA@mail.gmail.com> <55a0048a-7fa1-49cd-a70f-8f7d948adf27@tuxon.dev>
In-Reply-To: <55a0048a-7fa1-49cd-a70f-8f7d948adf27@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 16:36:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUb79rt2YVQO66_+8YcmAyS-PwFVcx0XfZVN-to3EB2SQ@mail.gmail.com>
Message-ID: <CAMuHMdUb79rt2YVQO66_+8YcmAyS-PwFVcx0XfZVN-to3EB2SQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] clk: renesas: rzg2l-cpg: Add support for MSTOP
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux@armlinux.org.uk, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de, 
	m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com, 
	broonie@kernel.org, alexander.stein@ew.tq-group.com, 
	eugen.hristev@collabora.com, sergei.shtylyov@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Mon, Nov 27, 2023 at 8:37=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 24.11.2023 11:08, Geert Uytterhoeven wrote:
> > On Thu, Nov 23, 2023 at 5:35=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >> On Mon, Nov 20, 2023 at 8:01=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.=
dev> wrote:
> >>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> RZ/{G2L, V2L, G3S} based CPG versions have support for saving extra
> >>> power when clocks are disabled by activating module standby. This is =
done
> >>> though MSTOP specific registers that are part of CPG. Each individual
> >>> module have one or more bits associated in one MSTOP register (see ta=
ble
> >>> "Registers for Module Standby Mode" from HW manuals). Hardware manual
> >>> associates modules' clocks to one or more MSTOP bits. There are 3 map=
pings
> >>> available (identified by researching RZ/G2L, RZ/G3S, RZ/V2L HW manual=
s):
> >>>
> >>> case 1: N clocks mapped to N MSTOP bits (with N=3D{0, ..., X})
> >>> case 2: N clocks mapped to 1 MSTOP bit  (with N=3D{0, ..., X})
> >>> case 3: N clocks mapped to M MSTOP bits (with N=3D{0, ..., X}, M=3D{0=
, ..., Y})
> >>>
> >>> Case 3 has been currently identified on RZ/V2L for VCPL4 module.
> >>>
> >>> To cover all 3 cases the individual platform drivers will provide to
> >>> clock driver MSTOP register offset and associated bits in this regist=
er
> >>> as a bitmask and the clock driver will apply this bitmask to proper
> >>> MSTOP register.
> >>>
> >>> As most of the modules have more than one clock and these clocks are
> >>> mapped to 1 MSTOP bitmap that need to be applied to MSTOP registers,
> >>> to avoid switching the module to/out of standby when the module has
> >>> enabled/disabled clocks a counter has been associated to each module
> >>> (though struct mstop::count) which is incremented/decremented every
> >>> time a module's clock is enabled/disabled and the settings to MSTOP
> >>> register are applied only when the counter reaches zero (counter zero
> >>> means either 1st clock of the module is going to be enabled or all cl=
ocks
> >>> of the module are going to be disabled).

> > After giving this some more thought, it feels odd to derive the standby
> > state of a module from the state of its module clocks, while the latter
> > are already controlled through Runtime PM and a Clock Domain.
> >
> > A first alternative solution could be to drop the GENPD_FLAG_PM_CLK
> > flag from the RZ/G2L CPG clock domain, and provide your own
> > gpd_dev_ops.start() and .stop() callbacks that take care of both
> > module standby and clocks (through pm_clk_{resume,suspend}().
> > (See https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/base/powe=
r/domain.c#L2093
> > for the GENPD_FLAG_PM_CLK case).
> > That still leaves you with a need to associate an MSTOP register and
> > bitmask with a device through its module clocks.
> >
> > A second alternative solution could be to increase #power-domain-cells
> > from zero to one, and register individual PM Domains for each module,
> > and control module standby from the generic_pm_domain.power_{on,off}()
> > callbacks.  Devices would specify the module using the power-domains =
=3D
> > <&cpg <id> > property in DT, with <id> one of the to-be-added list of
> > modules in include/dt-bindings/clock/r9a08g045-cpg.h.  The RZ/G2L CPG
> > driver can handle the mapping from <id> to MSTOP register and bitmask.
> > This solution requires updates to DT, but you can keep compatibility
> > with old DTBs by only registering the new PM Domains when
> > #power-domain-cells is one.
> > The extra power saving would only be applicable with new DTBs, though.
>
> I prefer this alternative even though it cannot be applied for old DTBs, =
it
> looks to me that is more modular. What do you think?

I prefer the second alternative, too.

> The only thing is that MSTOP is not really a power off/on switch (if it
> would be implemented with generic_pm_domain.power_{on, off}) but is more

That's fine: Linux' PM Domains are fairly generic and abstract, and
not limited to pure power domains/areas.

> like a clock disable/enable functionality (it should not be an issue
> though, just saying)... According to manual (I'm referring to Figure 41.4
> Block Connection Overview for Module Standby Mode of HW manula of RZ/G3S)=
,
> it disables/enables the module's bus clock.

Thanks for the pointer! That picture nicely shows the internal behavior.
For comparison, on SH/R-Mobile and R-Car SoCs there is a similar
internal structure, but it is less visible to the programmer:
there are no individual controls for each clock or reset that is
fed into a module.  These are all hidden behind a single Module
Stop resp. Reset control bit.  In Linux, we modeled the module stop
bit as a gate clock, controlled by Runtime PM through the Clock Domain's
.start()/.stop() callbacks.

Note that you also have to take into account Figure 41.2 ("Modules in
Power Domain").  When adding support for power transitions later, you
can register a PM Domain representing PD_ISOVCC, and use that as the
parent PM Domain for the individual PM Domains for modules belonging
to PD_ISOVCC.  All of that can be handled in the driver, and would
not need any changes to DT.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

