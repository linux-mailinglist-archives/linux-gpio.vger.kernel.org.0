Return-Path: <linux-gpio+bounces-36855-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ3eKMXpBWrpdQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36855-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 17:27:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8949654403A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 17:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C860F302EA3C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF8B428829;
	Thu, 14 May 2026 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pgvz75ge"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D52427A16
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778772229; cv=none; b=IPy8/H8pMwSDzH+tl91MpB7VtVt5YlPe8IrV8udOBhBlVSg/E9Aqg9eU2grd6UtLXUGWbrJXaQfTd2C9NqAAzmmzOM85PQkp2WKBfzxcHWpWviTZnUOWXCXDHsgJOmgnzhNPLbPmI5Vfr6j5f4Yr7whpPjgPFl3M6BhA8deJqjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778772229; c=relaxed/simple;
	bh=UOMIBF6IJOiBHJ031b0CiERDKfflOx7IIddTWub9PkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYW5QVkxWPXlNSKqzMu4yExJwZCDmOrrLGrJ9Zyu/Fj/KIL/QzeHxIQcn/wu3Yu3jccEmYWiOBG9iCaa9eyz+nGGtGkq1q2yvYhGAhXCxpQ9xaH6/UbESw9LaULQzOWudt6jtl4sV6rcbJJ21aq5HeAXoUlaA5BIErICdqYlwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pgvz75ge; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so86981285e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778772226; x=1779377026; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+gKCjNZN7Myh92wsTwdDyQ4hRCAPzb5zU67ocdyFfL8=;
        b=pgvz75ge3T3pHSXjcn5SK35lIsvHyNnjvKxGsk1OE1n1+GkVrHDOlAel/reR/ffZ66
         8Qcdr5EqrphM+swYHeUSFA0GNDCG2n2v8Ht4+kZsD/D+aLdhS4Jc2O6vt+l4yIiw3Rj3
         9GKlGwBgqAl+t/5vIS5AwdiEyHuRgQ7dTWqGGjIBzPC1Y86UcpVcuIlT7VjpEgyc8Bv9
         guo3BZGH5CowE/Pqdi94y423KthAb2trDX0vSUI4sxMAeZ54t28gIi5OFFTCcGqurkAp
         TO/ZucoFQWaqi9yUErHCg6U+LQz+sNZdi27KukZJJCYEMXBVFvrfXb62CHBPyOshjyhy
         dLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778772226; x=1779377026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gKCjNZN7Myh92wsTwdDyQ4hRCAPzb5zU67ocdyFfL8=;
        b=OBpqL9/BUtc1zRamde71FJjYHidEnLPFE/mEWTNLnMueDgL6GUkdDKGybrtxdaHllE
         4sTgrBwjCGyTGh3vvXm14WoGB/pVd79WVRUwI9oFyP2exxxu9ZRLjChPFrRaTibIU5to
         MZs1xRt8Mf3RAd4RWq7diiDbFYa3ce+DhdT++XK1kbji/bhmwILLs8sHlGX1I58Ln8oR
         zqZsxJVjO9uWb/pnXvA7XeSv303PHcQoVRD19Nr4zGKzAISp2la5MzvmYQEuBVOT8POd
         xm/4nUZMoMroDX0vaiUn88OFrlg8GIJXu3w8UfMYNiMH6ZqXiZI6mRwZSyV/lE97UIks
         SfGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XdVZm96paIBDprvDbKwitUExhfM3fjWAoI+8FGtmlkLQxkk+5zcQlyDXq/c9O8o1ixzP2rqdbKXZs@vger.kernel.org
X-Gm-Message-State: AOJu0YwYR9M2v22KwcAAhJNx2LVtpmdabM9nPF4aZTHuSD1BjaS0sH55
	1yfQkUSMMRt4L7MFjXGgnz2Xr0o5gg7/MQDjTDL0P2IpwgE/WpQww6EC1+817Rgg7+8=
X-Gm-Gg: Acq92OEywHjbuf8w8jbem36F641ZL0AU8aDHwoHw2wHGSryhJAi1o3XMSW4rykbVIxD
	4lSN6Pb1ujxkSahODUKLrkepTjOvH5IOLpvPGREWFC9UIBFKqsjyUlTayeL2e8W88XnmfdA4k1R
	gft0TNXjblCXA3vZf7yTyZjOyMZfWHXJHtpoQXFqjHcjm0V+JiaZlORPjEbHbvwUqdjp2TzeRaR
	NR1QdH3t5E+0ApFEUYMa+QAqJkl4queOJpXdCjPvrVhFjl0KNPUhRSruKV6VbbgMkHKpbEq9DqF
	Zqq+wZ2QDBxjLpNVtLE3r8XFiejW/Shua9ttAaLKLOtONu1umuOz2vkbEqBldqhp6flaR3OcK7d
	L3HqA7Ow8plf1R35V6bMZELEYWmGWXV9asJfy0hgS4sRwONCubWgzADYxwa+K0u3qV0TMlAj64E
	CNvnFyHWyHlwLmCyt33Dhp3WJCU9pvwow7CDNe+Sw/8gOwlTmjuXEBhJQsJk5Iptuaedr5Vfl8X
	acxyKJW8RmSDa2rd3Hpm6haZ4+uHSjgCcvjl1KS7S4MetC9CuH+wUWpczq/NQeqxS64H4y0qPtO
	L6UZG10b0Z78zwudf8I=
X-Received: by 2002:a05:600c:c104:b0:48f:e230:2a25 with SMTP id 5b1f17b1804b1-48fe2302b27mr16709485e9.32.1778772225397;
        Thu, 14 May 2026 08:23:45 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm7358296f8f.9.2026.05.14.08.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:23:44 -0700 (PDT)
Date: Thu, 14 May 2026 16:23:41 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <agXo_evi1oFLBJoo@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
 <agRzai1UoHEIotZe@aspen.lan>
 <3c6e7ec5-f600-44ee-a97a-211a99102744@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c6e7ec5-f600-44ee-a97a-211a99102744@lunn.ch>
X-Rspamd-Queue-Id: 8949654403A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36855-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,aspen.lan:mid,1c:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:35:13PM +0200, Andrew Lunn wrote:
> > However the real reason we jammed this on is because I couldn't find a
> > way to get the phy/mdio code to turn one on. However it is possible to
> > add regulator support to MDIO devices by extending their existing logic
> > to manage resets so it can also manage a regulator. It comes out fairly
> > clean so we can add that to the patch set and remove the
> > regulator-always-on.
>
> We, I have rejected this before. It might look clean and easy, but it
> is not. How do you determine the order of enabling reset, regulators
> clocks? How do you specify the need sleeps in between these different
> operations?

I agree it is only easy for the easy cases. I can even be specific
that, for me, the easy cases mean enabling a single regulator and where
power-on reset is not significantly slower than reset-pin reset
meaning we don’t need to distinguish between a power-cycling reset and
a reset-pin reset).

However I think that complex cases cannot be handled by generic MDIO
code. I think these cases are best solved from the MDIO probe method of
individual PHY drivers.


> There is nothing in particular MDIO specific here, and there is
> generic power sequencing code in the kernel. And a while back,
> somebody said they would look at what is needed to make MDIO busses
> and Ethernet PHYs make use of that generic power sequencing code. That
> is the better way to do this.

I’d love to know if they got anywhere. I’ve reviewed the pwrseq
subsystem and I don’t think it is intended to solve the problems
presented by the ethernet phys on a rb3gen2. Let me try to explain my
reasoning. Maybe someone will be able to point out what I have missed!

I’m afraid this must be necessarily long but to help navigate the
general structure is:

 1. Quick review of the pwrseq subsystem
 2. Quick review of the PCI power control driver, both the concept and
    to note why some PCI power control drivers do not use pwrseq
 3. Summarize how this works on DT
 4. Introduce a description of an qca8081 in “modern devicetree”
 5. Examine whether pwrseq or the power control driver concept would
    make writing MDIO device drivers easier than “just doing it in the
    probe method”

pwrseq is only generic in the sense that has a compact consumer API and
that it provides reusable tools that allow *specific* power sequencing
drivers to be written relatively easily. The specific drivers created
with these tools typically bind to something concrete in the DT (e.g.
compatible = "pcie-m2-m-connector" or "qcom,wcn6855-pmu"): things you
can point to such as the M.2 slot or a special purpose power management
unit in a combo chip.

The pwrseq core allows each driver to register a .match() method to
allow pwrseq driver recognise that another driver has asked for its
help to enable a pwrseq target. They usually match, not by compatible
but by traversing the phandle relationships from the device’s DT node
to verify that they link back to the pwrseq driver in the expected
manner.

For ethernet phys I'm doubtful pwrseq offers any benefit because most
phys are standalone and therefore just get a bunch of board level
regulators: there isn’t anything concrete in the DT for which we can
instantiate a pwrseq device. Without a device it is difficult to fire
up a driver that is responsible for knowing what power sequence is
needed to activate the phy. It is therefore better to encode this
knowledge in the phy driver instead.

Another related-but-different concept is PCI power control drivers.
When pwrseq was introduced the first client was a PCI power control
driver. PCI power control drivers are used to solve chicken-and-egg bus
enumeration problems. They work binding a platform bus driver to any
PCI device with a compatible string (e.g. compatible = "pci17cb,1103")
before attempting to enumerate the real device. The platform device
driver responsible for turning on the power ready for enumeration but
does not drive the actual PCI device. This ensures the device can
respond to enumeration requests and, eventually, probe the “real” PCI
driver.

Note that the PCI power control drivers do not have to use the pwrseq
framework to turn the power on. There are examples of both in the
current tree:

* pci-pwrctrl-pwrseq.c uses pwrseq and is, at it's core, just table of
  compatible strings and pwrseq target names. This allows it recognize,
  from the compatible string what pwrseq target to request.
  For example on wcn6855 it can request that only the WLAN hardware
  be enabled (BT power-on is requested separately before using the
  HCI UART).

* pci-pwrctrl-tc9563.c is the power controller driver for the
  TC956x PCIe switch. This is an example of the case where there
  is nothing for a pwrseq driver to bind to. TC956x just gets a bunch
  of individual regulators and a reset line. For that reason
  pci-pwrctrl-tc9563 just uses the regular C code to grab everything
  is needs, relying on things like the bulk regulator helpers keep the
  code as compact as possible.

One key insight about the above is that there are three separate device
drivers parsing specific properties of the node. Having all the
properties related to a device in a single node was very strongly
pushed for by Rob H[1] and AFAIK is a key expectation for new DT
bindings. This strongly influences the scope of pwrseq and PCI power
control (and power domains) and discourages giving DT a generic means
to express power sequencing. That knowledge is handed to us implicitly
by the compatible string!

For example, in the case of WCN6855[2] we have:

1. pci-pwrctrl-pwrseq which uses the compatible string to get itself
   bound and to decide what pwrseq target to enable.
2. pwrseq-qcom-wcn which reads all the *-supply properties together
   with a couple of clocks and enable lines. It ensures we don't
   enable anything until the power lines have settled.
3. ath11k[_pci] which isn’t probed until the device is “on” and
   then reads the remaining properties such as qcom,calibration-variant

[1]: https://lore.kernel.org/all/CAL_JsqLAnJqZ95_bf6_fFmPJFMjuy43UfP2UxzEmFMNnG_t-Ug@mail.gmail.com/
[2]: https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts#L987C1-L1004C3

In short, the pwrseq client API is beguilingly simple but that does not
mean the providers are generic. In the above example there must still
be something, written in C, that contains knowledge of how to turn on a
wcn6855.

Let’s turn our attention to MDIO.

Following the pattern above where all the links related to power come
from the main device node, then the phy node for the qca8081 in an
rb3gen2 would look like something like this:

    tc956x_emac1_phy: ethernet-phy@1c {
        compatible = "ethernet-phy-id004d.d101";
        reg = <0x1c>;

        reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
        # On RB3gen2 all supplies are controlled by a single GPIO
        # so we link all supplies to that single regulator
        avdd-supply = <&qep_1p8>;
        avdd18-supply = <&qep_1p8>;
        vdd-supply = <&qep_1p8>;
        vddldo-supply = <&qep_1p8>;
        vdd18-supply = <&qep_1p8>;
        vdd125-supply = <&qep_1p8>;

        pinctrl-names = "default";
        pinctrl-0 = <&qep_irq_pin>;
        interrupts-extended = <&tlmm 101 IRQ_TYPE_LEVEL_LOW>;
    };

Once we have established what the DT looks like then the question
becomes where to put "something, written in C [or Rust], that contains
burned in knowledge of how to turn on a wcn6855^H^H^H^H^H^H^Hqca8081"?

The qca8081 on rb3gen2 just gets a bunch of individual regulators and a
reset. As in the pci-pwrctrl-tc9563 example above, this means there is
nothing in the DT for a pwrseq driver to bind to. Even if we could find
a way to do that, it is not obviously useful to decouple how to turn on
an MDIO device from how to drive it. Thus I think the right answer to
that is to put the code to fire up the regulators into the qca808x.c
driver and it looks to me like the existing probe/remove methods would
already work perfectly well as the place to put it.

Does MDIO bus code need to know about pwrseq at all? I don't think so.
Perhaps there are phys that are suitable to be managed via pwrseq
because they are part of a larger ethernet chip with some kind of PMU,
but that doesn’t require it to be exposed outside the driver. The
drivers for such a phy can simply call the pwrseq APIs from its probe
method.

Do we need something equivalent to PCI power control for the MDIO bus?
I don't think the same chicken-and-egg problem actually exists for MDIO
bus. If a subnode with a compatible string (and regulators) exists we
don't need to scan that address because we already know enough about
the bus to probe the driver and therefore can let the driver handle
turning on the power (just like we do for I2C or SPI drivers).

MDIO does have bus scanning but we only need to scan for things we
don’t know about and must do so on the assumption they are already
powered on. That’s because when we don’t know what’s there then your
earlier question ("How do you determine the order of enabling reset,
regulators clocks?") is impossible to answer. There could be a generic
bus-supply property to handle easy cases where a single regulator
activates everything on the bus although this isn’t needed on RB3gen2
since we statically know what is on the bus.

If you've got this far and not found a fatal mistake in the reasoning
then perhaps it sounds like an awful lot of churn to have to modify
each PHY driver every time that PHY is used in an embedded platform
with software controlled regulators!

That, in a nutshell, is why I was tempted to copy the phy-supply
property to cover the "easy cases" we discussed at the outset. Doing so
does nothing to impede the hard cases since the code for that would
still work fine from the MDIO probe method. At worst a driver might
have to register with a flag to suppress any generic power/reset logic
from the core (since it's obviously wrong to wait for a reset to
complete on a device that isn't powered up).

To be clear I’m very happy to back away from phy-supply. We use the same
patterns we see in I2C and SPI drivers and rely purely on probe methods
instead to turn on regulators. However I don’t see how to exploit power
sequencing code to help describe these things generically.


Daniel.

