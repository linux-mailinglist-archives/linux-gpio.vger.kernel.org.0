Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92A6247D01
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 10:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfFQI3V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 04:29:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52218 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbfFQI3V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 04:29:21 -0400
Received: from broadband.bt.com (unknown [IPv6:2a00:23c5:58d:db00:36ee:cfb1:e0d:7749])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: martyn)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1C2A8278FEA;
        Mon, 17 Jun 2019 09:29:20 +0100 (BST)
Message-ID: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
Subject: [RFC] Addition of kernel
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, kernel@collabora.com
Date:   Mon, 17 Jun 2019 09:29:18 +0100
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus, Bartosz,

We are currently in the position that we would like to pre-configure
some GPIOs at boot time and be able to later affect the state of GPIOs
configured as outputs or read the state of GPIOs previously configured
as inputs.

The device tree property `gpios-line-names` gives a very useful
mechanism for identifying the correct GPIO to use/read for a given
purpose in user space, but doesn't provide any guidance on how that
line is expected to be used. The gpio-hogging functionality enables us
to configure GPIOs during boot, ensuring that the correct state is
present on the relevant GPIO lines, but does not provide the ability to
modify or read these GPIOs at runtime.

I understand that a lot of people have requested such functionality in
the past, but I'm not sure if anything concrete has ever been
submitted. I'm interested in determining what the general feeling
towards adding such functionality would be and to gain some input with
regards to how this should/could be implemented (assuming the general
concept is acceptable).

Initially we are thinking of providing a device-tree node containing a
"gpio-default" property and would contain a lot of the same properties
as "gpio-hog".

Code wise, it would seem to need to follow roughly the same flow as
gpio-hog, but avoid running "gpiod_request_commit()" so that the GPIO
line could later be requested by user space.

I suspect there's a whole load of details that I'm missing at this
stage and I've not fully thought through the implications for later
removal.

Does something like this seem viable upstream?

Martyn

