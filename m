Return-Path: <linux-gpio+bounces-37251-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOM5Dy3PDmq7CQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37251-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:23:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 963255A240C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3F063028F15
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 08:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD88364049;
	Thu, 21 May 2026 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCqnDG/3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE323392E
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353968; cv=none; b=PT4PZ5ADJpbpd10TEzET77Ek2tG8INXslJbHIyb5r9dAnAU6w9DTh1iBb+5LTUEfXXfRUSj2nUCw0Zj0+9/O4rzQntMTa3YBqkPrDNkjGlctL7WDRJsO38pdq/n0e23lfsIS0gLkl0AqOMJ6YbyQndgpM7rPiOggy0uABWa04pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353968; c=relaxed/simple;
	bh=T5U+sHNh9SY1A3DhxmKruyqToYLu8Kmk4BpSzUhgDA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mml0h3T45VUBCIshOC5cFAXzdag5sMzKOEDwXxMMwxkLlDYoiaUVGl1z2V9/L3f8fWnhtieO86ULBEyAvrbCCvCxDXzu+oVzKXtJHvzUemnue9eVIqc++yEimCr2PmLy2sPJGBvxHgXD2A1gAQkNYd1wL0xW69mz0a5SvcrKpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCqnDG/3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8651F000E9
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779353967;
	bh=x85DMC3FN6co4hcBdHKLxdvR9gcuHPSmRt07VBnTAPc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dCqnDG/38TPSTZM7pnxtHCFEBDRqWmkm8LU9Uw/G8OUQaPj8WQ/tWrG5/5ZQgnOD9
	 R5JsUlUHDiOxi8RbqfUi8unsRhDAOG7ACdZIqlnNcYcI5Vpw3D2QlXjkfK1K5Vntqm
	 UPz9r7Mdh0RpyxxzW34/OlD2YfQYVQ51/VxL4eqbwfavnNNBV9Mavf5Py9ygXP67DD
	 vheLRMRh8cwhRfM7VrxS6P0nOx9w/giT/1aSiAzJN9yo/GkMg6wUbhH9MG944GZBDS
	 TsmMCIRjGZO5Gj7ubdO9EHaYo6dA3dBaDfvSftmKVaE6w9ZuHPcebOEtnlkFG6wBol
	 atL9FFFlIBQvw==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1331e851faaso3058713c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 01:59:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ErwID22tSSrdI3uz4cOxtx166NrzbCnRtzakiZ8qmgO5ftoKQpDtm2ep9N15TeQZgeSnb0DfHKSSU@vger.kernel.org
X-Gm-Message-State: AOJu0YyZB+3pGQG7O4xISZ2xnDeogzSYuEMkLZCb769Q8rw01JSFiMkX
	qRrrT0WbhWGMl2K4YWaZw6iX/i78/GAH7rM3IWBtKv5tYQpPgosHtZUQ+7q6yUdOnS3lwGwTpwH
	G8qka8b6XWsn3dvnC+3aOzZoy0NZuvHPjbTzeMlWt9A==
X-Received: by 2002:a05:7022:404:b0:12d:c9b6:bbe2 with SMTP id
 a92af1059eb24-13634938379mr812446c88.2.1779353966611; Thu, 21 May 2026
 01:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520173129.1382489-1-markus.stockhausen@gmx.de>
In-Reply-To: <20260520173129.1382489-1-markus.stockhausen@gmx.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 21 May 2026 10:59:06 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf6EQDF-fSVb+jhmLvMUi2eJ5QhukKC08S-T12HKinibw@mail.gmail.com>
X-Gm-Features: AVHnY4JpsDyZ1J4AFcHu2FM0JrI0aufZRorn5QAWhoQughYlsq5ZWEu9WPq198g
Message-ID: <CAMRc=Mf6EQDF-fSVb+jhmLvMUi2eJ5QhukKC08S-T12HKinibw@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with shared SCL
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: wsa+renesas@sang-engineering.com, andi.shyti@kernel.org, linusw@kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37251-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 963255A240C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 7:31=E2=80=AFPM Markus Stockhausen
<markus.stockhausen@gmx.de> wrote:
>
> Some lower end hardware (especially Realtek based switches) are
> designed with multiple I2C buses that share a single clock line.
> E.g. the D-Link DGS-1250-28X realizes 4 I2C SFP busses with 5 gpios.
>
> Enhance the i2c-gpio driver so it can handle such hardware designs.
>
> - Detect GPIOs that are used by multiple I2C buses in the dts by
>   using a unique identifier for each managed SCL.
>
> - The first probing instance allocates and requests the shared SCL
>   GPIO plus an associated rt_mutex. Subsequent instances detect the
>   existing entry via the identifier and increment a reference count
>   to reuse the descriptor.
>
> - All data transfers are serialized via custom lock_ops that handle
>   both the standard adapter bus lock and the shared SCL mutex. This
>   ensures mutual exclusion across adapters sharing the clock line.
>
> This patch was successfully tested on Linksys LGS310C that has two
> SFP slots with two GPIO based I2C buses that share a sinlge SCL.
> Test environment: OpenWrt snapshot ported to kernel 6.19.14
> including CONFIG_GPIO_SHARED=3Dy and CONFIG_GPIO_SHARED_PROXY=3Dy.
>

Thanks for testing!

> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
>
> ---
>
> v2 -> v3
>   - Fix lockdep_set_class() with DEBUG_LOCK_ALLOC=3Dy
> v2: https://lore.kernel.org/linux-i2c/20260518161013.900504-1-markus.stoc=
khausen@gmx.de/
>
> v1 -> v2
>   - Convert fault injector to scl->gpio (reported by test robot)
>   - Use rt_mutex and i2c_lock_operations instead of pre/post_xfer
>     (logic taken from i2c-cht-wc.c and enhanced)
>   - i2c_gpio_lookup_scl()
>     - Improve list control flow
>     - Improve comment
>     - Carve out SCL node comparison into i2c_gpio_scl_matches()
>   - Drop "valid" attribute and directly check gpiod instead
>   - Improve fwnode args check for #gpio-cells=3D1 case
>   - Add sda/scl cleanup during probe failures
>   - Replace dev_info() with dev_dbg()
>   - Reflect changed locking in commmit message
>   - Tested with config option GPIO_SHARED/GPIO_SHARED_PROXY
>     as requested by Bartosz
> v1: https://lore.kernel.org/linux-i2c/20260514092042.3265986-1-markus.sto=
ckhausen@gmx.de/
>
> v0 -> v1
>   - Initially this enhancement was submitted as a new driver with
>     a new devicetree structure. After some discussion Wolfram
>     advised to make only an enhancement to the i2c-gpio driver.
> v0: https://lore.kernel.org/linux-i2c/20260511162528.84508-1-markus.stock=
hausen@gmx.de/
> ---
>  drivers/i2c/busses/i2c-gpio.c | 208 +++++++++++++++++++++++++++++++---
>  1 file changed, 194 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.=
c
> index f4355b17bfbf..80e1347ecbac 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -18,9 +18,23 @@
>  #include <linux/property.h>
>  #include <linux/slab.h>
>
> +static LIST_HEAD(i2c_gpio_scl_list);
> +static DEFINE_MUTEX(i2c_gpio_scl_list_lock);
> +static struct lock_class_key i2c_gpio_scl_lock_key;
> +
> +struct i2c_gpio_scl_data {
> +       struct fwnode_handle *fw_node;
> +       u32 fw_pin;
> +       u32 fw_flags;
> +       struct gpio_desc *gpio;
> +       struct rt_mutex lock;
> +       refcount_t ref;
> +       struct list_head list;
> +};
> +
>  struct i2c_gpio_private_data {
>         struct gpio_desc *sda;
> -       struct gpio_desc *scl;
> +       struct i2c_gpio_scl_data *scl;
>         struct i2c_adapter adap;
>         struct i2c_algo_bit_data bit_data;
>         struct i2c_gpio_platform_data pdata;
> @@ -31,6 +45,11 @@ struct i2c_gpio_private_data {
>  #endif
>  };
>
> +static inline struct i2c_gpio_private_data *adap_to_priv(struct i2c_adap=
ter *adap)
> +{
> +       return container_of(adap, struct i2c_gpio_private_data, adap);
> +}
> +
>  /*
>   * Toggle SDA by changing the output value of the pin. This is only
>   * valid for pins configured as open drain (i.e. setting the value
> @@ -53,7 +72,7 @@ static void i2c_gpio_setscl_val(void *data, int state)
>  {
>         struct i2c_gpio_private_data *priv =3D data;
>
> -       gpiod_set_value_cansleep(priv->scl, state);
> +       gpiod_set_value_cansleep(priv->scl->gpio, state);

That one bothers me a bit. We're driving a clock line but may end up
sleeping? That doesn't sound right. We typically do:

setscl();
udelay();

I know it's been like this before and maybe I'm not understanding the
whole picture so feel free to disregard the comment.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

