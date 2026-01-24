Return-Path: <linux-gpio+bounces-31038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL+UMYc0dWmjCAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 22:07:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC77EFF1
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 22:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76FAA3003622
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 21:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A9D283C87;
	Sat, 24 Jan 2026 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPjkGIl/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76514280CFC
	for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769288835; cv=none; b=RDHt6vpUnhR1YyS73oEcM4d0p/SKGhMcRo0OnkLBLqPZNIqEkguWYkPGByC6iiVFPkMRpLPb5mBRCcD5K7aUlFz/I2HD4jGUCuKUOhPS+pd7qWnLiG6N5xj7Fxb0bEV2/hIJGOkO8aNq0wilci+rbMjy9c+VaQ9JCjAY4f10BMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769288835; c=relaxed/simple;
	bh=UclknFpN2ZWd4uyp6MAwU80cqRd1X1vfkRRK1+y/n94=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhQW9xXhJ664kRRi8x0MyxSrdoN80EK2Tfr/pRsueum3HKhP6lTNANtg+reO6EY61XYIswnBASXZv9bxbh5vntIXAm/BKycIcP0QL8aM4ZX6f2nQZelUIwWjOhrQ8i1LxahytGpCeR+qTGtKKsHlJqrFziEoa/gTOf8+py1cFIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPjkGIl/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4761FC2BC86
	for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769288835;
	bh=UclknFpN2ZWd4uyp6MAwU80cqRd1X1vfkRRK1+y/n94=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=iPjkGIl/MsKSCH3BAycQX0vWp+HMLch/o5/rIimI7jUSnVBt7vOdjyITWccbSwha2
	 /Gwu74jqRVijsbLwDF71/L27hjEvJD7l5DXvZ4SHisYzwDvFYPR6KzlGT/H+xQxY+H
	 pR0WW6qGsk+19+3UaE+SyGpoQ7gXAcNCsbLn4jFfdeuYk7X+IXP4cmyehpNeXpv4kQ
	 OcxiVzJYl4iKllN7nYfAKjLxVbXaoQ8uTOYbosVdJXNjzfVKzjOsV6e5grfbeVXL5C
	 1b3vOgC3owq6APXHo63GFQ/5XvRwFWONSN8pDeHov0EtirL5i9y/pf62EHPQ0Gfx46
	 nal33MTE+NkdQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37fd6e91990so35602741fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 13:07:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXw56ETm+Or9e26Hj2btKJbP7y2uYKifGOhg8JfOqWytTC+8ytqhVGhE2wSYJKLugMU4qlK0T/fNPS1@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6lbzmzSR5EXl6S8j5PHAEKSYbdQZ//kCvEnm3hYEI//wrZxS
	mYilpE/ej5HJ5/jv3KylpsiMk7vrlcBqD0UEaNRYIjmHdjOiyGzb91Doz2inKrveQY4ONzilVuK
	WHDhWaS7XCucBdi8OV5IuVvE1cowogrfOCEaI1bY58g==
X-Received: by 2002:a05:651c:4187:b0:37b:a30e:fe1e with SMTP id
 38308e7fff4ca-385f9dcdbe9mr139721fa.18.1769288833896; Sat, 24 Jan 2026
 13:07:13 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Jan 2026 16:07:12 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Jan 2026 16:07:12 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
 <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com> <16771005.dW097sEU6C@diego> <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com>
Date: Sat, 24 Jan 2026 16:07:12 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
X-Gm-Features: AZwV_Qj_fkFL-PYes-rtNy10zLCqgVdVHFhLik2wLfULvoDu_c3HvmP55gf-KMU
Message-ID: <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31038-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62FC77EFF1
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 00:45:25 +0100, Robin Murphy <robin.murphy@arm.com> sai=
d:
> On 2026-01-23 9:52 pm, Heiko St=C3=BCbner wrote:
>> Am Freitag, 23. Januar 2026, 21:57:50 Mitteleurop=C3=A4ische Normalzeit =
schrieb Robin Murphy:
>>> On 2026-01-23 7:27 pm, Bartosz Golaszewski wrote:
>>>> On Fri, Jan 23, 2026 at 2:27=E2=80=AFPM Robin Murphy <robin.murphy@arm=
.com> wrote:
>>>>>
>>>>>>>
>>>>>>> It's not a big issue for the hdmirx driver specifically, but I wond=
er
>>>>>>> how many more (less often tested) rockchip drivers use GPIOs from t=
heir
>>>>>>> IRQ handler.
>>>>>
>>>>> Yeah, seems this finally reached my distro kernel and now the kernel =
log
>>>>> on one of my boards is totally flooded from gpio_ir_recv_irq()
>>>>> (legitimately) calling gpio_get_value()... that's not really OK :/
>>>>>
>>>>
>>>> This has always been a sleeping driver. The driver does not know the
>>>> firmware configuration it'll be passed and - as I explained above -
>>>> depending on the lookup flags, we may call .direction_output() and
>>>> descend into pinctrl which uses mutexes. Ideally, we'd make
>>>> GPIO-facing pinctrl operations not sleeping but this is a long-time
>>>> project and quite complex. Telling the GPIO core that it cannot sleep
>>>> is simply incorrect - even if it worked for this particular use-case -
>>>> and has an impact on paths we're choosing.
>>>>
>>>> Can the GPIO reading in the gpio-ir-recv driver be done from a
>>>> high-priority workqueue by any chance? Or can we make it a threaded
>>>> interrupt?
>>>

Let me circle back to my earlier question. Would the following change work?

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-rec=
v.c
index a6418ef782bc..1f95e54bd146 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -26,6 +26,11 @@ struct gpio_rc_dev {
 };

 static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t gpio_ir_recv_irq_thread(int irq, void *dev_id)
 {
 	int val;
 	struct gpio_rc_dev *gpio_dev =3D dev_id;
@@ -120,9 +125,10 @@ static int gpio_ir_recv_probe(struct platform_device *=
pdev)

 	platform_set_drvdata(pdev, gpio_dev);

-	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
-				IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
-				"gpio-ir-recv-irq", gpio_dev);
+	return devm_request_threaded_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
+					 gpio_ir_recv_irq_thread,
+					 IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
+					 "gpio-ir-recv-irq", gpio_dev);
 }

 static void gpio_ir_recv_remove(struct platform_device *pdev)

>>> rockchip_gpio_get() is essentially nothing but a readl(), please explai=
n
>>> how that could sleep? Saying that countless in-tree and out-of-tree
>>> arbitrary GPIO consumer drivers should pointlessly refactor just to
>>> avoid the GPIO core spewing spurious WARN()s is not reasonable.
>>>

Right, so gpiod_get_value() is a bit different from gpiod_set_value() becau=
se
it indeed can't descend into pinctrl.

>>> I appreciate there are cases where the warning most definitely *is*
>>> relevant, which is why I picked up this discussion rather than proposin=
g
>>> a revert, even though the documentation says:
>>>
>>>    * @can_sleep: flag must be set iff get()/set() methods sleep, as the=
y
>>>
>>> where since neither rockchip_gpio_get() nor rockchip_gpio_set()
>>> themselves sleep, apparently this flag must *not* be set. It's
>>> irrelevant that a higher-level gpiod_set_value() invocation might end u=
p
>>> calling .set_direction before it gets as far as calling .set - that's
>>> not the gpio_chip's fault, and gpiolib knows exactly what it's doing.
>>>

Well, the wording may be unfortunate and it's probably been this way for a
long time. I don't know the history here, this probably needs to be revised=
.

Please keep in mind: I don't deal with a single rockchip driver but with
a generic subsystem supporting hundreds of GPIO drivers and thousands of
users across the kernel tree. Not to mention all the API abuse like people
calling direction_output() from atomic context etc. We have all kinds of
combinations of sleeping and non-sleeping consumers and suppliers. It's
sometimes hard to find the middle ground.

Maybe the core GPIO code should not try to simulate open-source/open-drain
on non-sleeping chips for gpiod_set_value(). Or maybe we need a .uses_pinct=
rl
flag parallel to .cansleep which tells GPIO core that while set/get don't
sleep, direction_output/input may.

>
>> rockchip_pmx_gpio_set_direction()'s only function is to set the GPIO
>> pinmux - it does not handle the actual the actual direction.
>>
>> Can't we move the pinctrl_gpio_direction_input/_output() call just over
>> to the request callback of the gpiochip?
>

What if the user calls gpiod_direction_output() on a pin set to input?

> In fact, after an hour or so chasing through the code, is that not just
> pretty much this? (Not even compile tested as I'd rather go to bed now...=
)
>
> Cheers,
> Robin.
>
> ----->8-----
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 47174eb3ba76..118edd57c252 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -164,12 +164,6 @@ static int rockchip_gpio_set_direction(struct gpio_c=
hip *chip,
>   	unsigned long flags;
>   	u32 data =3D input ? 0 : 1;
>
> -
> -	if (input)
> -		pinctrl_gpio_direction_input(chip, offset);
> -	else
> -		pinctrl_gpio_direction_output(chip, offset);
> -
>   	raw_spin_lock_irqsave(&bank->slock, flags);
>   	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr=
);
>   	raw_spin_unlock_irqrestore(&bank->slock, flags);
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index e44ef262beec..2fc67aeafdb3 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev *pc=
tldev, unsigned selector,
>   	return 0;
>   }
>
> -static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> -					   struct pinctrl_gpio_range *range,
> -					   unsigned offset,
> -					   bool input)
> +static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +					    struct pinctrl_gpio_range *range,
> +					    unsigned int offset)
>   {
>   	struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
>   	struct rockchip_pin_bank *bank;
> @@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops =3D=
 {
>   	.get_function_name	=3D rockchip_pmx_get_func_name,
>   	.get_function_groups	=3D rockchip_pmx_get_groups,
>   	.set_mux		=3D rockchip_pmx_set,
> -	.gpio_set_direction	=3D rockchip_pmx_gpio_set_direction,
> +	.gpio_request_enable	=3D rockchip_pmx_gpio_request_enable,
>   };
>
>   /*
>

I'm not sure what's going on here. You don't really need to call
pinctrl_gpio_direction_input/output()?

I'm putting it on my TODO list to figure out a proper way of interacting
with pinctrl. At the same time, I want to fix your problem so the .uses_pin=
ctrl
flag sounds like a solution. This would make gpio-shared-proxy still use
a mutex but we wouldn't warn in gpiod_get_value(). Unless you can simply sw=
itch
to a threaded interrupt in the IR driver. Maybe the latency would be
negligible?

Bartosz

