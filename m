Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C74AC1397E6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 18:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgAMRil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 12:38:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:37720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728633AbgAMRil (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Jan 2020 12:38:41 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A80012081E;
        Mon, 13 Jan 2020 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578937120;
        bh=BukZKWNlxC+JwXLqOoHMayChsb+HPTO4K7l59x2xb2s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RUYgfHXRk8+M0dS1OS29Cv9nL6I6NxkyTZUnDDVcWiEvSUG3+0Gw7dIpWSlGfySkz
         oFsfgZWidxVqOh4gA9/THmZmv6hzMmteJltwDXkTh+SEPKNgkz1zcmEY09kmTn3T8c
         B+TpykPpdJR2O383fl8iii04+LNQITclltFneS8Q=
Received: by mail-qt1-f175.google.com with SMTP id d18so9788589qtj.10;
        Mon, 13 Jan 2020 09:38:40 -0800 (PST)
X-Gm-Message-State: APjAAAXUbtL/oTX5zF2ZoeIUYQ5uQBJdqsVqWORT2AZT6F0H7CvKQ8sv
        JsmC/jkiLYG5QhWYg3/uf8KPitaWTcjw6nBdFQ==
X-Google-Smtp-Source: APXvYqz8ZpzCIdEqPnB6Xb4WCqJl6WDzcbEbT8Lk9bxvnLRfjwOfbd5b9X315eomLEuZjxSWd9Ult4Ze9/2TwzIblrk=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr15214178qtq.143.1578937119737;
 Mon, 13 Jan 2020 09:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20191218062024.25475-1-rahul.tanwar@linux.intel.com>
In-Reply-To: <20191218062024.25475-1-rahul.tanwar@linux.intel.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 13 Jan 2020 11:38:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKi0K5Db5CGk7AKqwHML3J8uD5AK8mjoGtiTupr41K_fQ@mail.gmail.com>
Message-ID: <CAL_JsqKi0K5Db5CGk7AKqwHML3J8uD5AK8mjoGtiTupr41K_fQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: intel: Update to use generic bindings
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yixin zhu <yixin.zhu@linux.intel.com>, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 12:20 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:
>
> Kernel 5.5 adds generic pin mux & cfg node schema. Update pinctrl bindings
> for LGM to use these newly added schemas. Also, rename filename to match
> the compatible string.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> ---
>  .../devicetree/bindings/pinctrl/intel,lgm-io.yaml  |  76 ++++++++++++++
>  .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 116 ---------------------
>  2 files changed, 76 insertions(+), 116 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml

Pretty sure I've said on multiple occasions to run 'make
dt_binding_check'... Linux-next is broken by this (and others).

> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> new file mode 100644
> index 000000000000..a386fb520510
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/pinctrl/intel,lgm-io.yaml#

Drop 'bindings' from the path.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Lightning Mountain SoC pinmux & GPIO controller binding
> +
> +maintainers:
> +  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
> +
> +description: |
> +  Pinmux & GPIO controller controls pin multiplexing & configuration including
> +  GPIO function selection & GPIO attributes configuration.
> +
> +allOf:
> +  - $ref: pincfg-node.yaml#
> +  - $ref: pinmux-node.yaml#

This 'allOf' is at the wrong level...

> +
> +properties:
> +  compatible:
> +    const: intel,lgm-io
> +
> +  reg:
> +    maxItems: 1
> +
> +# Client device subnode's properties
> +patternProperties:
> +  '-pins$':
> +    type: object

...It should be here.

> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      function: true
> +      group: true
> +      pins: true
> +      pinmux: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +      drive-strength: true
> +      slew-rate: true
> +      drive-open-drain: true
> +      output-enable: true
> +
> +    required:
> +      - function
> +      - group
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    pinctrl: pinctrl@e2880000 {
> +        compatible = "intel,lgm-io";
> +        reg = <0xe2880000 0x100000>;
> +
> +        uart0-pins {
> +             pins = <64>, /* UART_RX0 */
> +                    <65>; /* UART_TX0 */
> +             function = "CONSOLE_UART0";
> +             pinmux = <1>,
> +                      <1>;
> +             groups = "CONSOLE_UART0";

'groups' is not a defined property. Should be 'group'.

> +          };
> +    };
> +
> +...
