Return-Path: <linux-gpio+bounces-6039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C68BA8BC
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 10:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A8FB1F22B4B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 08:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E64148FE7;
	Fri,  3 May 2024 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owkQbAI4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67647148853
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714724910; cv=none; b=Mw3luRhgez5iTw63xIs91ArETIjBodWswBl3Bo8clrK7vD15BJ+8ukmVB/pAS6awcjTqD85oz7nT1MpLXe/ePJBNh+3bWbUjveHkCo0QQaN0yKjPPJ817TdbY02pgqfO+oVZKl2NCDaxFFVOFWLRZOiQg7+HsUPD11vPUeNWJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714724910; c=relaxed/simple;
	bh=WPFQDOZyXqlIgSkFDs2liqlBzNzrSepKHsz+LqKxi18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFvB6BaVRc1zBVM5n9TtcB2AlYOkymx2lEVKSIKTc+i38KNLxPaOUPO+pNwjt65hmSbQxvo1nMVaRmFmSoWtTnja3i4oDIspFewBkSKWxcuQMuw6fdGanbhr+KeNX5ghy7zHOE2g/2i7SjfWhxLCYvOi0dfy49YkH/J1XA2eObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owkQbAI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF45C116B1;
	Fri,  3 May 2024 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714724909;
	bh=WPFQDOZyXqlIgSkFDs2liqlBzNzrSepKHsz+LqKxi18=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=owkQbAI4HDNZFH9hjnIOzf0LKj9YSWG0oHwOeBLU0zLjlvcyPb2SC/sgZOouqhec9
	 jcRV8LrCorHPw9XIoAQ/UOaKv8P9xuJT9K70t+BbW25fwPNJBoJtcZOZb86gx0snuZ
	 OnBSkyUWHEhJbUdi6e3lFDpLZXovRQxczhQaQJC3MrQ46yIq5rRwdzKNyoo+OOBDvV
	 UQjmCfHt/eul62Jxgckk6Z/YoQwslInXHUct77cNHZUUHUmsNnZFGE1lPiXaJYMJKz
	 6bD+juZrSbBO4WaC+28jnkDCOYC0xpRzsF2PBXruGrFUqP5DTG6aFlxrZnx/D6208Y
	 WjeOtRmdngw8A==
Date: Fri, 3 May 2024 10:28:17 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240503082714.ow5qtqu2myi3z2ug@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>

On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Add support for GPIOs connected to the MCU on the Turris Omnia board.
> >
> > This includes:
> > - front button pin
> > - enable pins for USB regulators
> > - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> > - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> > - on board revisions 32+ also various peripheral resets and another
> >   voltage regulator enable pin
> 
> ...
> 
> > -int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
> > -                  unsigned int len)
> > +int omnia_cmd_write_read(const struct i2c_client *client,
> > +                        void *cmd, unsigned int cmd_len,
> > +                        void *reply, unsigned int reply_len)
> >  {
> >         struct i2c_msg msgs[2];
> > -       int ret;
> > +       int ret, num;
> >
> >         msgs[0].addr = client->addr;
> >         msgs[0].flags = 0;
> > -       msgs[0].len = 1;
> > -       msgs[0].buf = &cmd;
> > -       msgs[1].addr = client->addr;
> > -       msgs[1].flags = I2C_M_RD;
> > -       msgs[1].len = len;
> > -       msgs[1].buf = reply;
> > -
> > -       ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > +       msgs[0].len = cmd_len;
> > +       msgs[0].buf = cmd;
> > +       num = 1;
> > +
> > +       if (reply_len) {
> > +               msgs[1].addr = client->addr;
> > +               msgs[1].flags = I2C_M_RD;
> > +               msgs[1].len = reply_len;
> > +               msgs[1].buf = reply;
> > +               num++;
> > +       }
> > +
> > +       ret = i2c_transfer(client->adapter, msgs, num);
> >         if (ret < 0)
> >                 return ret;
> > -       if (ret != ARRAY_SIZE(msgs))
> > +       if (ret != num)
> >                 return -EIO;
> >
> >         return 0;
> 
> Hold on, you are "patching" the code you just brought by the previous
> patch?! No, just do from the beginning how it should be at the end.

Fixed.

> > +#include <linux/devm-helpers.h>
> 
> Do you still need this?

Yes, for devm_delayed_work_drop().

> ...
> 
> > +#define FRONT_BUTTON_RELEASE_DELAY     50 /* ms */
> 
> Use proper unit suffix instead of a comment like many others do.
> 
> _MS here.

Fixed.

> > +static const char * const omnia_mcu_gpio_templates[64] = {
> > +       /* GPIOs with value read from the 16-bit wide status */
> > +       [4]  = "gpio%u.MiniPCIe0 Card Detect",
> > +       [5]  = "gpio%u.MiniPCIe0 mSATA Indicator",
> > +       [6]  = "gpio%u.Front USB3 port over-current",
> > +       [7]  = "gpio%u.Rear USB3 port over-current",
> > +       [8]  = "gpio%u.Front USB3 port power",
> > +       [9]  = "gpio%u.Rear USB3 port power",
> > +       [12] = "gpio%u.Front Button",
> > +
> > +       /* GPIOs with value read from the 32-bit wide extended status */
> > +       [16] = "gpio%u.SFP nDET",
> > +       [28] = "gpio%u.MiniPCIe0 LED",
> > +       [29] = "gpio%u.MiniPCIe1 LED",
> > +       [30] = "gpio%u.MiniPCIe2 LED",
> > +       [31] = "gpio%u.MiniPCIe0 PAN LED",
> > +       [32] = "gpio%u.MiniPCIe1 PAN LED",
> > +       [33] = "gpio%u.MiniPCIe2 PAN LED",
> > +       [34] = "gpio%u.WAN PHY LED0",
> > +       [35] = "gpio%u.WAN PHY LED1",
> > +       [36] = "gpio%u.LAN switch p0 LED0",
> > +       [37] = "gpio%u.LAN switch p0 LED1",
> > +       [38] = "gpio%u.LAN switch p1 LED0",
> > +       [39] = "gpio%u.LAN switch p1 LED1",
> > +       [40] = "gpio%u.LAN switch p2 LED0",
> > +       [41] = "gpio%u.LAN switch p2 LED1",
> > +       [42] = "gpio%u.LAN switch p3 LED0",
> > +       [43] = "gpio%u.LAN switch p3 LED1",
> > +       [44] = "gpio%u.LAN switch p4 LED0",
> > +       [45] = "gpio%u.LAN switch p4 LED1",
> > +       [46] = "gpio%u.LAN switch p5 LED0",
> > +       [47] = "gpio%u.LAN switch p5 LED1",
> > +
> > +       /* GPIOs with value read from the 16-bit wide extended control status */
> > +       [48] = "gpio%u.eMMC nRESET",
> > +       [49] = "gpio%u.LAN switch nRESET",
> > +       [50] = "gpio%u.WAN PHY nRESET",
> > +       [51] = "gpio%u.MiniPCIe0 nPERST",
> > +       [52] = "gpio%u.MiniPCIe1 nPERST",
> > +       [53] = "gpio%u.MiniPCIe2 nPERST",
> > +       [54] = "gpio%u.WAN PHY SFP mux",
> > +};
> 
> You may reduce the memory footprint of these just by doing "gpio%u."
> part(s) outside. Here compiler won't compress this (as in the case of
> repetitive string literals),

Are you saying that I should dynamically create another array just to
pass it to the gpiochip's names pointer?
 
> > +static const struct omnia_gpio {
> > +       u8 cmd, ctl_cmd;
> > +       u32 bit, ctl_bit;
> > +       u32 int_bit;
> > +       u16 feat, feat_mask;
> > +} omnia_gpios[64] = {
> 
> It's much better to decouple definition and assignment and put
> definition _before_ the macros that fill it.

Fixed.

> > +               scoped_guard(mutex, &mcu->lock)
> > +                       val = omnia_cmd_read_bit(mcu->client,
> > +                                                CMD_GET_EXT_CONTROL_STATUS,
> > +                                                EXT_CTL_PHY_SFP_AUTO);
> > +
> > +               if (val < 0)
> > +                       return val;
> 
> I would move that under guard  for the sake of better readability
> (usual pattern in place). It's anyway a slow path and one branch under
> the mutex won't affect anything.

OK.

> > +               if (val)
> > +                       return GPIO_LINE_DIRECTION_IN;
> > +
> > +               return GPIO_LINE_DIRECTION_OUT;
> 
> ...
> 
> > +       struct omnia_mcu *mcu = gpiochip_get_data(gc);
> > +       u32 sts_bits, ext_sts_bits, ext_ctl_bits;
> > +       int err, i;
> 
> > +       sts_bits = 0;
> > +       ext_sts_bits = 0;
> > +       ext_ctl_bits = 0;
> 
> Why not assign these inside the definition line?

OK.

> > +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> > +               if (omnia_gpios[i].cmd == CMD_GET_STATUS_WORD)
> > +                       __assign_bit(i, bits, sts_bits & omnia_gpios[i].bit);
> > +               else if (omnia_gpios[i].cmd == CMD_GET_EXT_STATUS_DWORD)
> > +                       __assign_bit(i, bits, ext_sts_bits &
> > +                                             omnia_gpios[i].bit);
> 
> One line?

That would be 81 columns, which I would like to avoid.
I can remove the _bits suffix from these variables, though. What do you
think?

> > +               else if (omnia_gpios[i].cmd == CMD_GET_EXT_CONTROL_STATUS)
> > +                       __assign_bit(i, bits, ext_ctl_bits &
> > +                                             omnia_gpios[i].bit);
> 
> Ditto?
> 
> > +       }
> 
> ...
> 
> > +       struct omnia_mcu *mcu = gpiochip_get_data(gc);
> > +       u16 ext_ctl, ext_ctl_mask;
> > +       u8 ctl, ctl_mask;
> > +       int i;
> > +
> > +       ctl = 0;
> > +       ctl_mask = 0;
> > +       ext_ctl = 0;
> > +       ext_ctl_mask = 0;
> 
> Assignments in the definition line?

OK

> > +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> > +               if (omnia_gpios[i].ctl_cmd == CMD_GENERAL_CONTROL) {
> > +                       ctl_mask |= omnia_gpios[i].ctl_bit;
> > +                       if (test_bit(i, bits))
> > +                               ctl |= omnia_gpios[i].ctl_bit;
> > +               } else if (omnia_gpios[i].ctl_cmd == CMD_EXT_CONTROL) {
> > +                       ext_ctl_mask |= omnia_gpios[i].ctl_bit;
> > +                       if (test_bit(i, bits))
> > +                               ext_ctl |= omnia_gpios[i].ctl_bit;
> > +               }
> > +       }
> 
> ...
> 
> > +/**
> > + * omnia_mask_interleave - Interleaves the bytes from @rising and @falling
> > + *     @dst: the destination u8 array of interleaved bytes
> > + *     @rising: rising mask
> > + *     @falling: falling mask
> > + *
> > + * Interleaves the little-endian bytes from @rising and @falling words.
> > + *
> > + * If @rising = (r0, r1, r2, r3) and @falling = (f0, f1, f2, f3), the result is
> > + * @dst = (r0, f0, r1, f1, r2, f2, r3, f3).
> > + *
> > + * The MCU receives interrupt mask and reports pending interrupt bitmap int this
> 
> an interrupt
> a pending
> int --> in ?

Thx.

> > + * interleaved format. The rationale behind it is that the low-indexed bits are
> > + * more important - in many cases, the user will be interested only in
> > + * interrupts with indexes 0 to 7, and so the system can stop reading after
> > + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> > + *
> > + * Feel free to remove this function and its inverse, omnia_mask_deinterleave,
> > + * and use an appropriate bitmap_* function once such a function exists.
> > + */
> > +static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
> > +{
> > +       for (int i = 0; i < sizeof(u32); ++i) {
> > +               dst[2 * i] = rising >> (8 * i);
> > +               dst[2 * i + 1] = falling >> (8 * i);
> > +       }
> 
> I will look at this later on,
> 
> > +}
> 
> > +static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *falling)
> > +{
> > +       *rising = *falling = 0;
> > +
> > +       for (int i = 0; i < sizeof(u32); ++i) {
> > +               *rising |= src[2 * i] << (8 * i);
> > +               *falling |= src[2 * i + 1] << (8 * i);
> > +       }
> > +}
> 
> and into this.
> 
> ...
> 
> > +static size_t omnia_irq_compute_pending_length(u32 rising, u32 falling)
> > +{
> > +       size_t rlen = 0, flen = 0;
> > +
> > +       if (rising)
> > +               rlen = ((__fls(rising) >> 3) << 1) + 1;
> > +
> > +       if (falling)
> > +               flen = ((__fls(falling) >> 3) << 1) + 2;
> > +
> > +       return max(rlen, flen);
> > +}
> 
> I am not sure why you need this, but it can be done easily
> 
> x = ((__fls(falling | rising) >> 3) << 1) + 1;
> if (falling)
>   return x + 1;
> return x;
> 
> and most likely you can drop minmax.h.

This will return different results for for example when
  rising = 0x100
  falling = 0x10
where we need to read only 3 bytes, but your version will say that we
need 4 bytes.

> > +static const char * const front_button_modes[2] = { "mcu", "cpu" };
> 
> 2 is not needed.

OK

> > -#include <linux/i2c.h>
> 
> ??? That is exactly the point to have things done from the beginning.

I must have somehow missed this before sending, I see that I've already
fixed it in my working branch.

> > +#include <linux/bitops.h>
> > +#include <linux/gpio/driver.h>
> >  #include <linux/if_ether.h>
> > +#include <linux/mutex.h>
> >  #include <linux/types.h>
> > +#include <linux/workqueue.h>
> >  #include <asm/byteorder.h>
> 
> ...
> 
> > +       err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> 
> Perhaps a helper for this (__fls(x) >> 3 + (y)) ? It seems it's used
> in a few places.
> 
> 
> > +       if (err)
> > +               return err;
> 
> --
> With Best Regards,
> Andy Shevchenko

