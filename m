Return-Path: <linux-gpio+bounces-26702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CABAF856
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 10:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D60F7A6D32
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 07:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76E6279782;
	Wed,  1 Oct 2025 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zZUY2eGa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA733277C9F
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759305599; cv=none; b=LDGnZWfE3SfIVoX+Lx6cywG954Fv1e8UYPlPymvvvTh7rtK7hkMhttcRAwpw7MhE3R/GjNbnz2e3WzgEvf6RBbleIYAAUVrkba9pqQojbs6yPUBnVjjy69CvObBUnPv8iOVOQFxupyMc21jgKF/DKBiHOAM9Ger3FSzDFH5QfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759305599; c=relaxed/simple;
	bh=x6UeMcCe5obgBTwjNo93awwj8tDerQhtcPpqW5qBfwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uThvrrL6EOTuJfJdWShleaCXls/017LQVXs9Img88dj/PHEu4TjG9dAS2+iLUN6s39ZsV57LKYbe4m2N0HfN0jP2GE00KyioYL0yocYYaW76WAJhyM95GYXv1e0zETPtLX7dDHT+PR3NtfzdJOagxe+ue3solFmZbRU/mAgohnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zZUY2eGa; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3635bd94f3eso61973521fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759305596; x=1759910396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKW1p+9BB5x+i0V3bTxF/cUf1KbiD9hqty7jzv8D68I=;
        b=zZUY2eGaaQ4xVqRYHmhSi0Tngc9W05ZgokeTi/XepmJLLq0AOZYOpxTeNUa8qcf3Bo
         gM6aFJ16PhWGWcwZMHe8jkn/AbEs5thzxovGGaLLY1f34jxCO8LFTdUG4hkcM6kmUEfs
         e59hLLZYywjdKLhgIxfrczlZWLTeHqm6a/SK+i+Grr6zHnGY+g/MprWNsGVBWo9SzXCu
         gX9/q5F/aWzx74l9N7Hl81TAmyW9QTxw75nppk7uUrzmsJkYcNMS4oQU86ibEL7MEVUG
         yj83VO11wUdyYobav4O+oItyHd9t3EsIPa9i6mpVDykxa+OJ0Wx6/2Rlay34OOuFAtUH
         F63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305596; x=1759910396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKW1p+9BB5x+i0V3bTxF/cUf1KbiD9hqty7jzv8D68I=;
        b=JfNm5Ibnx+NerDEp6HJyQcjwr8oZD58TX/rodIVvvVIGwOEsdMO04T2M7xNaSNpMIo
         COZijUnwrz5Vt4+woJPyOdYnr4qQlS00TUPc2rJydKfxRH5A+Ld0wvVosniwnMD1wl5+
         +tEu6c/JQkfmT+pUJv6WCLQvR1cN/hiae8WcZfXA+GlXsTU27W23LHA+Sc1kluI7YvaQ
         EXYXKqPQ046+Hp68B07eNF4s7QNXRlz/7ISA/bppZcziDLSn57DVKwUbhBU/FO8JxpUA
         0d1Z16neIcxnpViUF2T9PdywE87YmHlW5ogRU9lK5WMIPrpRfCh4LiqNpQg2u22xrUO6
         AIHg==
X-Forwarded-Encrypted: i=1; AJvYcCVoe6UWwLnGgZ0gnnV4ktkYozhQOO6WPgjZ6YqWWYyYEf0d5eajPgkmPBqD82R3LrOjfqLCfIbBnF10@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjj6eQZAZpIr9gsVFeWwjgvbtskyC1j/52B5lc1T/dmEYk9+A
	J7ttS9jcd9f+is4YgseCQhDOYYMuPbv6XnUjhjVTzJ0IG7c5iScq0yYvYTA4W/kmVS2YPUPYwfn
	nuU9yTvglWsVkrjEEhC1qccI3QA7fDKBLEoN7bWEzlg==
X-Gm-Gg: ASbGncuwtnP/FkbFg3//3bjU5+iPYXEU3wLylEgCHX7u18Lyh9HSi4g9QnC1WIjLQoT
	rbtUBFf72/X106PgTPSrRrPyv4h7sZZfcC/i0OKM+iD9OhMTYZCtNCoRb+AAuxATbGpGHz/7ert
	/nZ+czuHe75QEh5kfCLwlvq5eDeZvNy6y0eDivz3fiptGSRrwz27OruyopyShZtzTTtHv0fJhF6
	rNfrpB4UXP4/8+OV5Or6vHbYkEtQviNlA8wKEMGEg==
X-Google-Smtp-Source: AGHT+IGxzFWXtfZJUgdOl5BgYjkz3OL8BRxqskROvQoPsM0q+Nz4/fkWZQFVWVGkbG1jnJsZeb+7lZ2aWXYQoxZtGzI=
X-Received: by 2002:a2e:be1d:0:b0:36a:a8bb:9b81 with SMTP id
 38308e7fff4ca-373a7115c3dmr7043701fa.5.1759305595752; Wed, 01 Oct 2025
 00:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org> <CAHi4H7HLNu9YV8+dXshFigvjfMrYL+kGz5xWwab8L1nnefohaQ@mail.gmail.com>
In-Reply-To: <CAHi4H7HLNu9YV8+dXshFigvjfMrYL+kGz5xWwab8L1nnefohaQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 09:59:44 +0200
X-Gm-Features: AS18NWBjMmyfPBUCtdeozzmwdc5h00BJnV1PWnWa2euxui1VeKCvW3twVOe6s3g
Message-ID: <CACRpkdaAUXpYi7Z+zgZDhLiJiSUAndLhPMA5YOvnk2GGYOoj4A@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: bcmbca: Refactor and add BCM6846
To: William Zhang <william.zhang@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 8:43=E2=80=AFAM William Zhang <william.zhang@broadco=
m.com> wrote:

> I believe you have the access to Broadcom reference software and there
> is a pinctrl driver we
> use(bcmdrivers/opensource/misc/bca_pinctrl/impl1/pinctrl-bcmbca.c) in
> ref sw.

Yes I have looked at it, I generated the pin control groups from the
device tree used with this driver.

That driver is in a very bad shape, e.g. (just as an example):
static int bcmbca_pmx_set(struct pinctrl_dev *pctldev, unsigned
func_selector, unsigned group_selector)
{
#define LOAD_MUX_REG_CMD        0x21
#define PINMUX_DATA_SHIFT       12

    struct bcmbca_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
    volatile u32 __iomem *test_port_block_data_msb =3D pc->base;
    volatile u32 __iomem *test_port_block_data_lsb =3D
test_port_block_data_msb + 1;
    volatile u32 __iomem *test_port_cmd            =3D
test_port_block_data_lsb + 1;
    u32 tp_blk_data_lsb;

    tp_blk_data_lsb =3D group_selector;
    tp_blk_data_lsb |=3D (func_selector << PINMUX_DATA_SHIFT);
    *test_port_block_data_msb =3D 0;
    *test_port_block_data_lsb =3D tp_blk_data_lsb;
    *test_port_cmd =3D LOAD_MUX_REG_CMD;

    return 0;
}

This is not using writel() macros etc. Essentially the same code is found
in the bcm4908 driver, but cleaned up.

> The advantage of that driver is that we automatically
> generate all the pinmux pin and function info into the
> <soc>_pinctrl.dtsi and the pinctrl driver is designed in very generic
> way and does not have per chip pinmux function/group info in the
> driver code but rather from the device tree.  So for every chip, all
> we need to do is just generating the pinctrl.dtsi and no source code
> change is needed.

But if you can generate say 6846_pinctrl.dtsi, I guess from some
HW data that the public has no access to, then why can't you
generate bcm6846.c with the same contents as C structs?

> I understand this is not what a typical upstream
> pinctrl driver does but it does the job. Have you looked into that
> ref sw driver and what do you think that approach versus the current
> upstream driver?  Do you see any issue with that driver?  As far as I
> can tell,  it should work but we may have to leave 4908 with the
> existing driver and pinmux binding.

The downstream pinctrl-bcmbca.c driver is mostly using a
"one group per pin" approach.

This is very convenient for people doing development from HW
descriptions and thinking about pins as being muxable on an
individual basis.

Some drivers use this approach, the most notorious being
pinctrl-single.c.

But it has some real downsides, because it totally ignores
the fact that the hardware is *clearly* designed to mux pins
in groups and not individually.

This is one example from 6846_pinctrl.dtsi:

        i2c_scl_pin_68: i2c_scl_pinmux {
            pins =3D <68>;
            function =3D <0>;
        };

        i2c_sda_pin_69: i2c_sda_pinmux {
            pins =3D <69>;
            function =3D <0>;
        };

Why would you want to mux these two pins individually? They
are clearly not meant to be muxed individually, especially given
that they can only be muxed out on pins (68, 69), nowhere
else! If you want SCL then you want SDA as well and it's clearly
thought to be muxed in a pair by the HW designer.

But the DTSI description, from wherever it is generated, does not
create a group out of this.

In other cases, it is done properly:

        rgmii_pins: rgmii_pinmux {
            pins =3D <42 43 44 45 46 47 48 49 50 51 52 53>;
            function =3D <1>;
        };

OK so this muxes all the pins for RGMII into function 1 in one go.

In my driver this becomes:

        pins_rgmii: rgmii-pins {
                function =3D "rgmii";
                groups =3D "rgmii_grp";
        };

The contents of rgmii_grp is contained in the driver, and this is
roughly equivalent to just putting the data in C instead of in a DTSI.

If all pins were properly grouped in the DTSI file such as
the RGMII pins, I could generate my .c file from the DTSI
file, but right now I can't,

So clearly the DTSI generator is either not entirely sound or
using dubious HW info. Information has been lost in the design
system. Someone had a good vision of how this should work but
it is broken somewhere in the design information flow process.

I understand why Rafal went with the group-oriented approach because
clearly there are groups in the hardware, but the generated .dtsi is in
most cases not properly describing these groups.

If someone in Broadcom is interested in right now starting to actively
work on all the BCA drivers using automatic generation of groups
and include files, perhaps C files as suggested, I'm happy to help
out and integrate this with my driver. But then that needs to be
active and seeking advice from the actual HW designer on
what the grouping should actually be, so this is properly
reflected all the way, not just giving the illusion of a generated
HW description flow which in practice loses all the group
information.

I personally can't work with your HW data generator which is
clearly faulty and I need this supported now, so for me the best
approach is currently to do the BCM4908 approach and encode the
groups manually by inspecting this bogus DTSI file and correct it to
what was probably the HW designers intention, such as
the I2C pins being muxed together as a group. Reverse-engineering
is sometimes necessary.

Yours,
Linus Walleij

