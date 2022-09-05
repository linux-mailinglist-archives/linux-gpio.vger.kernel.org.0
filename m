Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A488C5AD0C8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 12:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236147AbiIEK4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 06:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236488AbiIEK4W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 06:56:22 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D4341D1A
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 03:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YfYeaR2zUXl+UbMCN66sy6n1zsUJyKzBMSOZ5/AztcU=; b=ZQzblhQyfvI3Yzxn9D68ibmcEA
        5TN4HfaI5rCgLyrFEjuLEZeJeofE3TB3yC6VQ5MhZufzbvfC9DQYbEtjAry/ElkpSiAMP6v3Fer9j
        0vZS0t28N8w3kxaHXdmSYw98I9MeJYn7GujSAI7VcrQZgrzUuLwlMp4TuPjFsAvRya/zQYeXJP9o4
        GTnn6za3+zdgzJGnurpq6X+YNHG7TbxlTo9QR/cddfjqZyqZZRpzc1RQZ+fN1iyzr1T+Q5B79Glba
        Jd2BhkAkH5ghnVmtyG7sMCD9DlkBEf8Jsy4cbj6jCQ7AzJcRrLC9V8FyT2WICFBGdUxNZWhFab3oT
        Giaotv6w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34102)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oV9lk-0002Du-8x; Mon, 05 Sep 2022 11:55:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oV9li-0007Dd-Qi; Mon, 05 Sep 2022 11:55:54 +0100
Date:   Mon, 5 Sep 2022 11:55:54 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <YxXVuvXZIWBDW0/r@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <1c876ae2-9d8b-4f47-8ca7-797fb484ad03@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c876ae2-9d8b-4f47-8ca7-797fb484ad03@www.fastmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 07:50:31PM +0200, Sven Peter wrote:
> Thanks for trying to upstream this!
> I just have three minor comments:
> 
> On Thu, Sep 1, 2022, at 15:54, Russell King wrote:
> > +	dev_info(dev, "Initialized (%d keys %p4ch..%p4ch)\n",
> > +		 smc->key_count, &smc->first_key, &smc->last_key);
> 
> I don't think upstream supports %p4ch. marcan added that format in our downstream
> tree iirc.

Before that can be resolved, we need the discussion about how to deal
with SMC keys to be resolved. Andy was suggesting using the endian
conversion macros in the GPIO driver to convert the hex XX value in
the gPXX keys which doesn't sound right.

If we changed the smc_key typedef to something like:

typedef struct { char s[4]; } smc_key;

Then we can safely print them using %.4s. We can also pass:

	key.s + 2

to hex2bin() since it will be in the correct order. We may need to
do some fixups when placing the key in the SMC messages.

If I'm reading the smc_rtkit code correctly, then
apple_smc_rtkit_get_key_by_index() swabs the returned key from the
SMC, but when we pass keys to the SMC, we don't swab them? So keys
to the SMC are in reverse byte order compared to the natural string,
but keys returned from the SMC are in conventional byte order for a
string? Is that right, or am I getting confused?

What I mean is that for a key ABCD, it's passed to the SMC as A in
bits 63..56, B in 55..48, C in 47..40, D in 39..32. When we receive
a key, A is in bits 7..0, B in bits 15..8, C in bits 23..16 and D
in 31..24?

> > +static int apple_smc_rtkit_write_key_atomic(void *cookie, smc_key key, 
> > void *buf, size_t size)
> > +{
> > +	struct apple_smc_rtkit *smc = cookie;
> > +	int ret;
> > +	u64 msg;
> > +	u8 result;
> > +
> > +	if (size > SMC_SHMEM_SIZE || size == 0)
> > +		return -EINVAL;
> > +
> > +	if (!smc->alive)
> > +		return -EIO;
> > +
> > +	memcpy_toio(smc->shmem.iomem, buf, size);
> > +	smc->msg_id = (smc->msg_id + 1) & 0xf;
> > +	msg = (FIELD_PREP(SMC_MSG, SMC_MSG_WRITE_KEY) |
> > +	       FIELD_PREP(SMC_SIZE, size) |
> > +	       FIELD_PREP(SMC_ID, smc->msg_id) |
> > +	       FIELD_PREP(SMC_DATA, key));
> > +	smc->atomic_pending = true;
> > +
> > +	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT, msg, NULL, 
> > true);
> > +	if (ret < 0) {
> > +		dev_err(smc->dev, "Failed to send command (%d)\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	while (smc->atomic_pending) {
> > +		ret = apple_rtkit_poll(smc->rtk);
> > +		if (ret < 0) {
> > +			dev_err(smc->dev, "RTKit poll failed (%llx)", msg);
> > +			return ret;
> > +		}
> > +		udelay(100);
> > +	}
> 
> I guess we could use try_wait_for_completion here and get rid of the special
> smc->atomic_pending path. Not sure if it makes the code much simpler though.

Delving into this, it seems this code is buggy.

If apple_smc_rtkit_write_key_atomic() is used from atomic contexts,
what prevents apple_smc_rtkit_write_key_atomic() being called while
apple_smc_rtkit_write_key() is executing?

Both these functions copy data to smc->shmem.iomem, so a call to
the atomic function will overwrite the non-atomic function's data.

Given that there doesn't seem to be a way to specify the offset of
the data in shmem to the SMC, are we sure that we can sensibly
support an atomic write operation?

Using try_wait_for_completion() just ends up destroying more
context in the non-atomic path.

In any case, how can we be sure that the call to
apple_smc_rtkit_recv_early() was really meant to complete the atomic
write as opposed to something else? I guess that would trigger a
"Command sequence mismatch" and an EIO error if it happens. Have
these occurred?

Lastly:

#define SMC_SHMEM_SIZE                  0x1000

#define SMC_WSIZE                       GENMASK(31, 24)
#define SMC_SIZE                        GENMASK(23, 16)

The size fields are one byte, but we error out if the size is larger
than the shmem size:

        if (size > SMC_SHMEM_SIZE || size == 0)
                return -EINVAL;

but we still try to squeeze the size into this byte-wide field:

               FIELD_PREP(SMC_SIZE, size) |

which isn't goint to work. If the size is limited by the protocol to
255 bytes (or is it 256, where 0 means 256?) then surely we should be
erroring out if size is above that maximum rather than the shmem size.

> > +static int apple_smc_rtkit_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct apple_smc_rtkit *smc;
> > +	int ret;
> > +
> > +	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
> > +	if (!smc)
> > +		return -ENOMEM;
> > +
> > +	smc->dev = dev;
> > +
> > +	smc->sram = platform_get_resource_byname(pdev, IORESOURCE_MEM, 
> > "sram");
> > +	if (!smc->sram)
> > +		return dev_err_probe(dev, EIO,
> > +				     "No SRAM region");
> > +
> > +	smc->sram_base = devm_ioremap_resource(dev, smc->sram);
> > +	if (IS_ERR(smc->sram_base))
> > +		return dev_err_probe(dev, PTR_ERR(smc->sram_base),
> > +				     "Failed to map SRAM region");
> > +
> > +	smc->rtk =
> > +		devm_apple_rtkit_init(dev, smc, NULL, 0, &apple_smc_rtkit_ops);
> > +	if (IS_ERR(smc->rtk))
> > +		return dev_err_probe(dev, PTR_ERR(smc->rtk),
> > +				     "Failed to intialize RTKit");
> > +
> > +	ret = apple_rtkit_wake(smc->rtk);
> > +	if (ret != 0)
> > +		return dev_err_probe(dev, ret,
> > +				     "Failed to wake up SMC");
> > +
> > +	ret = apple_rtkit_start_ep(smc->rtk, SMC_ENDPOINT);
> > +	if (ret != 0) {
> > +		dev_err(dev, "Failed to start endpoint");
> > +		goto cleanup;
> > +	}
> > +
> > +	init_completion(&smc->init_done);
> > +	init_completion(&smc->cmd_done);
> > +
> > +	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT,
> > +				       FIELD_PREP(SMC_MSG, SMC_MSG_INITIALIZE), NULL, false);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret,
> > +				     "Failed to send init message");
> 
> This should probably also "goto cleanup" here just in case we somehow manage to
> send the shutdown message after this one failed.

Good point, thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
