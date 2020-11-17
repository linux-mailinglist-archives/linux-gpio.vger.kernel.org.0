Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63092B6490
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 14:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732802AbgKQNsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 08:48:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732727AbgKQNr7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 08:47:59 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7C3C0613CF;
        Tue, 17 Nov 2020 05:47:59 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p22so3305900wmg.3;
        Tue, 17 Nov 2020 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wtRPmHgnz5X1Kb5wQe988YxeBIzauGayM+LxupkV9hU=;
        b=K6exzerX/Go7V6Q+x7FHPm4xpHTN9zwV+3KNS3M8AkytQWvrn4uJce020n04UP9PTm
         i0FZdnDeBf2cuK0V+XzlQAfuhjjTLm9YN/aX/rUNM6D7fib+zH7fQ0lGkpj6C6qlEbsX
         LPttGJve39Wv0RoocN4UDfCbrY/LD+h+BdGnLoDBfU/fHmKk5IsPJTBFFpUBps3BzouI
         o6lxWGoSMlFMEl00AapPCLUvp7x4YHvur3Q8dENYXw0rq2E6sTCbS1F9lg8RbqPSULOR
         iRN+JP4uUCyM7+96Sh7ST3EuEU+HWtlvYTV+mdFXf4TIVyaITFD+/OgR1FRwc87NnLN6
         R+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wtRPmHgnz5X1Kb5wQe988YxeBIzauGayM+LxupkV9hU=;
        b=Wm8b3UOy7DQqgB5hGZaY6xCmYVdyQLTNP8ELJ11ZkaIPhi2oHpI8pQaw7mkykXdIhX
         gQ3ooD+lUezGN+ndPfk9YyZ3TxHL47GU0ZzTgvXVtkOwDExhJ4zNQrtC26M8yVw2rnes
         0glr9o06ePwZJT3ZGOMXvVHdaZp9AJgQzFlnscTaDcoXn9iOsn08wtRwuhivczp3RI/F
         bOqAT2xt7JvfZlpghe8PaNpLZSq8O7VFzeF5BgwOcD8rva8Uj2kIPYK4nyfvoab3O/ZI
         Ex6k3GMYsURLAOep9S2ep7XLRa2c97H8vRiaTyCOGxeqbroiGrOFf7og9FdIBMdAydHS
         vSQg==
X-Gm-Message-State: AOAM531oh66/rXuIKcVK6Pn5Zw8XmVlW+uryo+6kWJV37rYzrhBpZG1t
        un5MFs9wk1/ek+DYBd5sDzQ=
X-Google-Smtp-Source: ABdhPJxUkbY+s0j/Ih+dPCP6czx7rsv21c1tFlLFkPICYayWqEzmgqz4lJIWMofYOMOBJQktU1rlHQ==
X-Received: by 2002:a1c:ddc4:: with SMTP id u187mr4693503wmg.55.1605620877837;
        Tue, 17 Nov 2020 05:47:57 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 30sm20901859wrd.88.2020.11.17.05.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 05:47:56 -0800 (PST)
Date:   Tue, 17 Nov 2020 14:47:54 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20201117134754.GB2589875@ulmo>
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org>
 <20201116155936.GE2224373@ulmo>
 <20201116163603.GA30507@willie-the-truck>
 <CALAqxLVDm923WRSB+DVxFacmEtmEPS7Qeq+rW_jbCDMNMWw9PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <CALAqxLVDm923WRSB+DVxFacmEtmEPS7Qeq+rW_jbCDMNMWw9PQ@mail.gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 11:48:39AM -0800, John Stultz wrote:
> On Mon, Nov 16, 2020 at 8:36 AM Will Deacon <will@kernel.org> wrote:
> > On Mon, Nov 16, 2020 at 04:59:36PM +0100, Thierry Reding wrote:
> > > On Fri, Nov 06, 2020 at 04:27:10AM +0000, John Stultz wrote:
> > > Unfortunately, the ARM SMMU module will eventually end up being loaded
> > > once the root filesystem has been mounted (for example via SDHCI or
> > > Ethernet, both with using just plain, non-IOMMU-backed DMA API) and t=
hen
> > > initialize, configuring as "fault by default", which then results fro=
m a
> > > slew of SMMU faults from all the devices that have previously configu=
red
> > > themselves without IOMMU support.
> >
> > I wonder if fw_devlink=3Don would help here?
> >
> > But either way, I'd be more inclined to revert this change if it's caus=
ing
> > problems for !QCOM devices.
> >
> > Linus -- please can you drop this one (patch 3/3) for now, given that i=
t's
> > causing problems?
>=20
> Agreed. Apologies again for the trouble.
>=20
> I do feel like the probe timeout to handle optional links is causing a
> lot of the trouble here. I expect fw_devlink would solve this, but it
> may be awhile before it can be always enabled.  I may see about
> pushing the default probe timeout value to be a little further out
> than init (I backed away from my last attempt as I didn't want to
> cause long (30 second) delays for cases like NFS root, but maybe 2-5
> seconds would be enough to make things work better for everyone).

I think there are two problems here: 1) the deferred probe timeout can
cause a mismatch between what SMMU masters and the SMMU think is going
on and 2) a logistical problem of dealing with the SMMU driver being a
loadable module.

The second problem can be dealt with by shipping the module in the
initial ramdisk. That's a bit annoying, but perhaps the right thing to
do. At least on Tegra we need this because all the devices that carry
the root filesystem (Ethernet for NFS and SDHCI/USB/SATA/PCI for disk
boot) are SMMU masters and will start to fault once the SMMU driver is
loaded.

The first problem is trickier, but if the ARM SMMU driver is built as a
module and shipped in the initial ramdisk it should work. Like I said,
this is annoying because it makes the development a bit more complicated
than just rebuilding a kernel image and flashing it (or boot it straight
=66rom TFTP) because now everytime the ARM SMMU module is built the
initial ramdisk needs to be updated (and potentially flashed) as well.

Thierry

P.S.: Interestingly this is very similar to the problem that I've been
trying to address for display hardware that's left on by the bootloader.
Given that, one potential solution would be to somehow retrieve memory
allocations done by these devices and create identity mappings in the
ARM SMMU address spaces for such devices, much like we plan to do for
devices left on by the bootloader (like the display controller for
showing a boot splash). I suspect that it's not really worth doing this
for devices that are only initialized by the kernel because we have a
bit of control over when we enable them, so I'd prefer if we just kept
things reasonably simple and made sure the SMMU was either always used
by a device from the start or not at all. Dynamically switching between
SMMU and no-SMMU seems a bit eccentric.

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+z1IgACgkQ3SOs138+
s6F6ohAAneS0yFFBHoNDyOBvzWz0HOfTqXdo3x/QX0dAfVKc6bJ0Qe/RLBWwNpSY
UjiqerKccBGe8l7Bf+b6Bj6/vKDLeMfI6hUawI51x3w4pf3u8HPsVEvsTOtPuVrX
IEmw4B24/OCZCaYLlVB8a23JXGV8zSleTvHCUehX2eqCmhVF1/UAz2ZqVKt1WVNw
BoIejtEgEvUkAgC+K2xlEXkKwhQCwc1ZyT3O98Ckc0oBmQm9PjxDL+TvUsWJWPNY
Bu0TVlQCrq6arWhuu78Bo+IhayrMcCiHKSW5UHpmAYK+8nMSjQx7G2pz6iu11TTk
LOeUemfODzr38DlHswfFdaDhWnTs6e5bA/4To719EoVai89kld+Ch4vcC9LXunp5
ZPBmeX/pOBtcqt62YzkGFMMhMsD5+4ufGKK1rXZANisp9DMBThO7OKcCh/vXtE1T
INGW040P33ZB6rNT3cEziha7AUMO/MsbcvMM78cy79jzp6rKwhHM5JNJtQ6vKaOn
pXjCt8cRQH7OY+BmyDEBJQFqTAd8rmrvtRxr6lNEMpxea3fy3u0BP9FjTf2EgF6S
FVQ1suGBvbYueWsjSDOML9C/CYZHojAmUNyadmYmBwEKyd9NNHi9RRTteZpWESPS
/Psgw2xKXBu2mxWo1v+lv6lEH4m/aVlM0a8iMJT6yWL4SSPN6Bo=
=oG/d
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
