Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 314A910F774
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 06:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLCFmv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 00:42:51 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:55187 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfLCFmu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 00:42:50 -0500
IronPort-SDR: 1d3cbX4jmGzyde8PjnivFnq6fHbKai6sEc2kaYive6h0RWkvQ9drIjeWjGmvYIS4gVLu+D52Pt
 +VI56eTKrIhDRNQIZWo3o+GjrnShHDSZy+DLArkSlkFA3JQmurvLnvMKyv9EK1EweKjyav/4Lj
 8WSSo3b/Vv9QQM0ZMJuQ0P3Vcq1cvwcSXLOWUxweHnwpl4EJ+GLaUPURonYjl83Ysy5YEpAkRn
 5niHbKsU2PiUqGbla+ej3PYmfz0hPgFw7+mp8m4s46N6dQ3TGTi3TScTUpnXcLRWk8/nNc706n
 aTM=
X-IronPort-AV: E=Sophos;i="5.69,272,1571731200"; 
   d="scan'208";a="45589576"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 02 Dec 2019 21:42:50 -0800
IronPort-SDR: 6qW7kvfV2RJQ+o/o5f2nDujbmBSwumb85KO+OiaQHueozhtxi3wK5lBcFsz8N2dtJn1QT92VPT
 Qgv43tx44fcY6bo6t1sgDkAQ2/TB6bY50B/bcNaNCkLbDDm0xne8hal71H0BF7iCi91KHq8gYV
 l4H+1KNiIKYYMMtq23CtXeCb0XUbkF3MqlcarsOUStxXqUmileh72a7vzHfPC790pHde63/MTs
 gsV2+TivzEA3wls2h/41pYkDHtbxnyvWVV/rC52Hep9lVTvn/oImikOQ6lqgMEgARN2n4oTAx6
 phw=
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
CC:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <585c4ad9-31fc-e87e-07c4-b8d6aa09c7e4@mentor.com>
Date:   Tue, 3 Dec 2019 11:12:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127084253.16356-6-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> +static int gpio_aggregator_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_desc **descs;
> +	struct gpiochip_fwd *fwd;
> +	int i, n;
> +
> +	n = gpiod_count(dev, NULL);
> +	if (n < 0)
> +		return n;
> +
> +	descs = devm_kmalloc_array(dev, n, sizeof(*descs), GFP_KERNEL);
> +	if (!descs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n; i++) {
> +		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);

can you please add this check as well as we need to return EPROBE_DEFER.

if (desc[i] == ERR_PTR(-ENOENT))
<                 return -EPROBE_DEFER;


> +		if (IS_ERR(descs[i]))
> +			return PTR_ERR(descs[i]);
> +	}
> +
> +	fwd = gpiochip_fwd_create(dev, n, descs);
> +	if (IS_ERR(fwd))
> +		return PTR_ERR(fwd);
> +
> +	platform_set_drvdata(pdev, fwd);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id gpio_aggregator_dt_ids[] = {
> +	{ .compatible = "gpio-repeater" },
> +	/*
> +	 * Add GPIO-operated devices controlled from userspace below,
> +	 * or use "driver_override" in sysfs
> +	 */
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, gpio_aggregator_dt_ids);
> +#endif
> +
> +static struct platform_driver gpio_aggregator_driver = {
> +	.probe = gpio_aggregator_probe,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.groups = gpio_aggregator_groups,
> +		.of_match_table = of_match_ptr(gpio_aggregator_dt_ids),
> +	},
> +};
> +
> +static int __init gpio_aggregator_init(void)
> +{
> +	return platform_driver_register(&gpio_aggregator_driver);
> +}
> +module_init(gpio_aggregator_init);
> +
> +static void __exit gpio_aggregator_exit(void)
> +{
> +	gpio_aggregator_remove_all();
> +	platform_driver_unregister(&gpio_aggregator_driver);
> +}
> +module_exit(gpio_aggregator_exit);
> +
> +MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
> +MODULE_DESCRIPTION("GPIO Aggregator/Repeater");
> +MODULE_LICENSE("GPL v2");



