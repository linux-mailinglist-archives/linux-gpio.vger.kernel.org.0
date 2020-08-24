Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8DE250078
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 17:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgHXPKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 11:10:01 -0400
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:58342
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727123AbgHXPJ5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Aug 2020 11:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDq5oENWFqu1PNDPILNW9ksUsQchTeq4KVelZlA4VorK/Y7Bec8QMvqF/McAiJtbzYg5Ow+TBSzK3XS97tG50URth0IjJhuhwlG0lMf7qUPKopjVIsgLFLMEinvdCRvGedI39cwon/tYHqg+FL8kfmF4HoB3muUdz5WHhl5XMquDSaCgO0vy7mmnXIBNLK7LHE6WVokIHsQ6Errk77OBSLGJ4ScxR+tvJHvWGWcE8i8chq0zKLpm0K7Ib77BGEMxiiQVKe+MnKAJjbIlDCglgkPqDh1+GhMnzvXw5OPp03fHF6FFEt6oqAZs4r37Vp/GI2WvbhjPdukv8q82xPBZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wto57/icWehXuCEwPMHlJTGZ71ilmGYtmVBIss4sN8M=;
 b=hKufXsDoxYJtMGs805WOyNQBkyb9INuAsJetMsGQhGcLwMZPLEkbenTOD8H3t+hWrWpK6eTzs1QvicYUw4s8n7j+DpNjj4joHoIuDMqNgj+y8m0Gu4Wgl9YoJ/3OQV2VPhLATs+eNYx19qYlI5rnmoBdtyhjK7eSYMdozxsusNw5+25vtuyb/JwLWAgJONxX91KR0U69zMSAuk/SrXUf9paFqbTe0FKY5Mc3N/bBlDbwNczqc0z+/cAC39Y4p6oa3el1g7HiN9dSUz9QlXV6c/dXL8ELgZBqnkWAakBf4AHGHVKh6McjSgJWLTvnVI2y6grAyzGXEPyMSYgwZJjiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wto57/icWehXuCEwPMHlJTGZ71ilmGYtmVBIss4sN8M=;
 b=jJ4EF+jnmBXhkxP60l+rQwMd8RUek1GZUXmObzFFabBxNzvS8pLVUgMJtBE4j/umynVwFr+K0/s3Vwu1W+NF9BmlHjbTk2W/ub2qB7dj8ES4FDtJQnsT+16Wrx9PQffSdRWbIaKadyMlNBU/Zbk1+Wh5DwZxTjYuLz59dmDoKcI=
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com (2603:1096:404:73::17)
 by TYAPR01MB4384.jpnprd01.prod.outlook.com (2603:1096:404:120::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 15:09:47 +0000
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::e1a0:8e97:f2b7:c9d9]) by TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::e1a0:8e97:f2b7:c9d9%2]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 15:09:47 +0000
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: pinctrl: rzn1: Convert to json-schema
Thread-Topic: [PATCH] dt-bindings: pinctrl: rzn1: Convert to json-schema
Thread-Index: AQHWd60potnxulZi0USUP8M4OLJxHalCfc1w
Date:   Mon, 24 Aug 2020 15:09:47 +0000
Message-ID: <TY2PR01MB2924258A9762FD083630B628DF560@TY2PR01MB2924.jpnprd01.prod.outlook.com>
References: <20200821112059.5133-1-geert+renesas@glider.be>
In-Reply-To: <20200821112059.5133-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 639cbc1b-c9b5-4781-3662-08d8483fbdad
x-ms-traffictypediagnostic: TYAPR01MB4384:
x-microsoft-antispam-prvs: <TYAPR01MB4384B413F0039E75FCAB7450DF560@TYAPR01MB4384.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eUlHHkSRjULCBW+2ut3WxV2NLUoIVrwQZ9FvpL7izDU0qZ3vs6D8Qt1apj2oMWK+bSY94IipUpCOokKoUn0Vt0FBjn85Kl/yHeXI+TmK/qBvwJzJqPSCQUN34YcC576C/pKPVnaKGplVsECRlddVxxB7uYmayRUefIHgljOcXED6VbjGvUFYCzc+1CdbGlvAK5gN5uC1dnNdOAUWA+wwHlU/ras97k4hxKfwiO3SueTUIKOpURJlKr5sU6jYnqLkOwsgdasYAe6whIGnJfnUFD+KiX3rAonvyFjnCoS6XD+wanErdqZ8IqcJk9FvvmtnWY7DDAXJh9a8K2tbyBE8WH2wY+89HVDEADVvcKUZsmgebMXgvKaMmqdrLIEsOnfJNNMDbdlVITl/GXnhyJGi9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB2924.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(76116006)(2906002)(9686003)(66946007)(71200400001)(52536014)(316002)(86362001)(478600001)(83380400001)(33656002)(966005)(54906003)(110136005)(66446008)(64756008)(66556008)(66476007)(55016002)(5660300002)(8676002)(26005)(7696005)(53546011)(186003)(8936002)(6506007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 8POr9wPz+1rBJf39k+UhCVoifqCJvCER8Wc5xkeDscrwgkgWOumEbnoFdfGpk62aMfqMlOP5fkyCFf+UKz01q0HRGEP1xuvoz15mZGTfgIf4vnYgSUxhWX+P2B9BLXNkJaxYil5t+YofCkGqwroO1BmpGJ6tP+JkAtHyIYxACDqEqblLm6sSh/tTfui1jUkKt8QF6raI33oUf5iS6fEl3pq6ocZUppcqz4y7bO5y8phpSVWAZjlXwejmDnPd1fzafrnKieXPj+w4bYiE2+3NdlF6Elz7PLfp7WaYNSu+YFGwqp1ZArI8B+wmgFzbZcwsl+hg7nBP2K0s/F9MprCtF8m7KeKXeCUVgLEkJAsOZ46V1IjbYk1h24vLMd27U7dW/HqPwS+yLhBhMQIRrrsW1SwzOZ9oa2HMuHmfpwasA4Pcuzhhv1hpwlQU/kxjUUZeFEMeMhrcZUxc/2wVYh79pglrPi8o/KVe7JWWF9o0zswkgeox9NhnE6px29eyRejTFz0zCNANwC96Zr1D54uEl19ssIWDwQOckbgut72kx1HCOLSrRpLffFvGdubuxYOIWRHhtdoY42wQtsE2NwmNMKHigd7gpWC/7Rac40GCuYEzM8oX9N1Ni1Uu7qC/MmOk6qmBH+2/qa0qvjGS4YYYbw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2924.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639cbc1b-c9b5-4781-3662-08d8483fbdad
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 15:09:47.3791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /B8ocpXTZn1qSZbrX/JyziY46KMa81sfkUjqGFRH+nMDwWUV3XubaFlOOTZkpEYv9YMWX0E69u6ep6ozJ46WJIc+99+Vb5/K6F1FRGH6FwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4384
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for the patch.=20


On Fri, Aug 21, 2020 at 12:12 PM Geert Uytterhoeven <geert+renesas@glider.b=
e> wrote:
>=20
> Convert the Renesas RZ/N1 Pin controller Device Tree binding
> documentation to json-schema.
>=20
> Use "pinctrl" generic node name.
> Drop generic and consumer examples, as they do not belong here.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This is a clean and suitable conversion to me.=20
For completion I ran this against my dts files for the rzn1 for testing
purposes on next-20200824 without issues.

Reviewed-by: Gareth Williams <gareth.williams.jx@renesas.com>
Tested-by: Gareth Williams <gareth.williams.jx@renesas.com>

> ---
> Note: "phandle: true" is needed because dt-schema does not add it
>       automatically to subnodes.
>=20
> To be queued in sh-pfc for v5.10.
> ---
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.txt | 153 ------------------
>  .../pinctrl/renesas,rzn1-pinctrl.yaml         | 129 +++++++++++++++
>  2 files changed, 129 insertions(+), 153 deletions(-)  delete mode 100644
> Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
>  create mode 100644
> Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-
> pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-
> pinctrl.txt
> deleted file mode 100644
> index 25e53acd523e2bea..0000000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
> +++ /dev/null
> @@ -1,153 +0,0 @@
> -Renesas RZ/N1 SoC Pinctrl node description.
> -
> -Pin controller node
> --------------------
> -Required properties:
> -- compatible: SoC-specific compatible string "renesas,<soc-specific>-pin=
ctrl"
> -  followed by "renesas,rzn1-pinctrl" as fallback. The SoC-specific compa=
tible
> -  strings must be one of:
> -	"renesas,r9a06g032-pinctrl" for RZ/N1D
> -	"renesas,r9a06g033-pinctrl" for RZ/N1S
> -- reg: Address base and length of the memory area where the pin controll=
er
> -  hardware is mapped to.
> -- clocks: phandle for the clock, see the description of clock-names belo=
w.
> -- clock-names: Contains the name of the clock:
> -    "bus", the bus clock, sometimes described as pclk, for register acce=
sses.
> -
> -Example:
> -	pinctrl: pin-controller@40067000 {
> -	    compatible =3D "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
> -	    reg =3D <0x40067000 0x1000>, <0x51000000 0x480>;
> -	    clocks =3D <&sysctrl R9A06G032_HCLK_PINCONFIG>;
> -	    clock-names =3D "bus";
> -	};
> -
> -Sub-nodes
> ----------
> -
> -The child nodes of the pin controller node describe a pin multiplexing -
> function.
> -
> -- Pin multiplexing sub-nodes:
> -  A pin multiplexing sub-node describes how to configure a set of
> -  (or a single) pin in some desired alternate function mode.
> -  A single sub-node may define several pin configurations.
> -  Please refer to pinctrl-bindings.txt to get to know more on generic
> -  pin properties usage.
> -
> -  The allowed generic formats for a pin multiplexing sub-node are the
> -  following ones:
> -
> -  node-1 {
> -      pinmux =3D <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -      GENERIC_PINCONFIG;
> -  };
> -
> -  node-2 {
> -      sub-node-1 {
> -          pinmux =3D <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -
> -      sub-node-2 {
> -          pinmux =3D <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -
> -      ...
> -
> -      sub-node-n {
> -          pinmux =3D <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -  };
> -
> -  node-3 {
> -      pinmux =3D <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -      GENERIC_PINCONFIG;
> -
> -      sub-node-1 {
> -          pinmux =3D <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -
> -      ...
> -
> -      sub-node-n {
> -          pinmux =3D <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -  };
> -
> -  Use the latter two formats when pins part of the same logical group ne=
ed
> to
> -  have different generic pin configuration flags applied. Note that the =
generic
> -  pinconfig in node-3 does not apply to the sub-nodes.
> -
> -  Client sub-nodes shall refer to pin multiplexing sub-nodes using the
> phandle
> -  of the most external one.
> -
> -  Eg.
> -
> -  client-1 {
> -      ...
> -      pinctrl-0 =3D <&node-1>;
> -      ...
> -  };
> -
> -  client-2 {
> -      ...
> -      pinctrl-0 =3D <&node-2>;
> -      ...
> -  };
> -
> -  Required properties:
> -    - pinmux:
> -      integer array representing pin number and pin multiplexing
> configuration.
> -      When a pin has to be configured in alternate function mode, use th=
is
> -      property to identify the pin by its global index, and provide its
> -      alternate function configuration number along with it.
> -      When multiple pins are required to be configured as part of the sa=
me
> -      alternate function they shall be specified as members of the same
> -      argument list of a single "pinmux" property.
> -      Integers values in the "pinmux" argument list are assembled as:
> -      (PIN | MUX_FUNC << 8)
> -      where PIN directly corresponds to the pl_gpio pin number and
> MUX_FUNC is
> -      one of the alternate function identifiers defined in:
> -      <include/dt-bindings/pinctrl/rzn1-pinctrl.h>
> -      These identifiers collapse the IO Multiplex Configuration Level 1 =
and
> -      Level 2 numbers that are detailed in the hardware reference manual=
 into
> a
> -      single number. The identifiers for Level 2 are simply offset by 10=
.
> -      Additional identifiers are provided to specify the MDIO source per=
ipheral.
> -
> -  Optional generic pinconf properties:
> -    - bias-disable		- disable any pin bias
> -    - bias-pull-up		- pull up the pin with 50 KOhm
> -    - bias-pull-down		- pull down the pin with 50 KOhm
> -    - bias-high-impedance	- high impedance mode
> -    - drive-strength		- sink or source at most 4, 6, 8 or 12 mA
> -
> -  Example:
> -  A serial communication interface with a TX output pin and an RX input =
pin.
> -
> -  &pinctrl {
> -	pins_uart0: pins_uart0 {
> -		pinmux =3D <
> -			RZN1_PINMUX(103, RZN1_FUNC_UART0_I)	/*
> UART0_TXD */
> -			RZN1_PINMUX(104, RZN1_FUNC_UART0_I)	/*
> UART0_RXD */
> -		>;
> -	};
> -  };
> -
> -  Example 2:
> -  Here we set the pull up on the RXD pin of the UART.
> -
> -  &pinctrl {
> -	pins_uart0: pins_uart0 {
> -		pinmux =3D <RZN1_PINMUX(103, RZN1_FUNC_UART0_I)>;
> 	/* TXD */
> -
> -		pins_uart6_rx {
> -			pinmux =3D <RZN1_PINMUX(104,
> RZN1_FUNC_UART0_I)>; /* RXD */
> -			bias-pull-up;
> -		};
> -	};
> -  };
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-
> pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-
> pinctrl.yaml
> new file mode 100644
> index 0000000000000000..4a43af0d6e02a68b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yam
> +++ l
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rzn1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1 Pin Controller
> +
> +maintainers:
> +  - Gareth Williams <gareth.williams.jx@renesas.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a06g032-pinctrl # RZ/N1D
> +          - renesas,r9a06g033-pinctrl # RZ/N1S
> +      - const: renesas,rzn1-pinctrl   # Generic RZ/N1
> +
> +  reg:
> +    items:
> +      - description: GPIO Multiplexing Level1 Register Block
> +      - description: GPIO Multiplexing Level2 Register Block
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: bus
> +    description:
> +      The bus clock, sometimes described as pclk, for register accesses.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties:
> +  anyOf:
> +    - type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      description:
> +        A pin multiplexing sub-node describes how to configure a set of =
(or a
> +        single) pin in some desired alternate function mode.
> +        A single sub-node may define several pin configurations.
> +
> +      properties:
> +        pinmux:
> +          description: |
> +            Integer array representing pin number and pin multiplexing
> +            configuration.
> +            When a pin has to be configured in alternate function mode, =
use
> +            this property to identify the pin by its global index, and p=
rovide
> +            its alternate function configuration number along with it.
> +            When multiple pins are required to be configured as part of =
the
> +            same alternate function they shall be specified as members o=
f the
> +            same argument list of a single "pinmux" property.
> +            Integers values in the "pinmux" argument list are assembled =
as:
> +            (PIN | MUX_FUNC << 8)
> +            where PIN directly corresponds to the pl_gpio pin number and
> +            MUX_FUNC is one of the alternate function identifiers define=
d in:
> +            <include/dt-bindings/pinctrl/rzn1-pinctrl.h>
> +            These identifiers collapse the IO Multiplex Configuration Le=
vel 1
> +            and Level 2 numbers that are detailed in the hardware refere=
nce
> +            manual into a single number. The identifiers for Level 2 are=
 simply
> +            offset by 10.  Additional identifiers are provided to specif=
y the
> +            MDIO source peripheral.
> +
> +        phandle: true
> +        bias-disable: true
> +        bias-pull-up:
> +          description: Pull up the pin with 50 kOhm
> +        bias-pull-down:
> +          description: Pull down the pin with 50 kOhm
> +        bias-high-impedance: true
> +        drive-strength:
> +          enum: [ 4, 6, 8, 12 ]
> +
> +      required:
> +        - pinmux
> +
> +      additionalProperties:
> +        $ref: "#/additionalProperties/anyOf/0"
> +
> +    - type: object
> +      properties:
> +        phandle: true
> +
> +      additionalProperties:
> +        $ref: "#/additionalProperties/anyOf/0"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +    #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
> +    pinctrl: pinctrl@40067000 {
> +            compatible =3D "renesas,r9a06g032-pinctrl", "renesas,rzn1-pi=
nctrl";
> +            reg =3D <0x40067000 0x1000>, <0x51000000 0x480>;
> +            clocks =3D <&sysctrl R9A06G032_HCLK_PINCONFIG>;
> +            clock-names =3D "bus";
> +
> +            /*
> +             * A serial communication interface with a TX output pin and=
 an RX
> +             * input pin.
> +             */
> +            pins_uart0: pins_uart0 {
> +                    pinmux =3D <
> +                            RZN1_PINMUX(103, RZN1_FUNC_UART0_I) /* UART0=
_TXD */
> +                            RZN1_PINMUX(104, RZN1_FUNC_UART0_I) /* UART0=
_RXD */
> +                    >;
> +            };
> +
> +            /*
> +             * Set the pull-up on the RXD pin of the UART.
> +             */
> +            pins_uart0_alt: pins_uart0_alt {
> +                    pinmux =3D <RZN1_PINMUX(103, RZN1_FUNC_UART0_I)>;
> +
> +                    pins_uart6_rx {
> +                            pinmux =3D <RZN1_PINMUX(104, RZN1_FUNC_UART0=
_I)>;
> +                            bias-pull-up;
> +                    };
> +            };
> +    };
> --
> 2.17.1

Thanks for the work,

Gareth
