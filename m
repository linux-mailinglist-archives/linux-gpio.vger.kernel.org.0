Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0011FF9C7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 18:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgFRQ5E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 12:57:04 -0400
Received: from mail-co1nam11on2072.outbound.protection.outlook.com ([40.107.220.72]:59489
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728664AbgFRQ5C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jun 2020 12:57:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3VINemABtrHo2ns9N/Jqp3ffCg7CyNsM+0XdMtHPBKw9tpp9gSW3POkWIoEaxv6hlXgOlnhw3PMdjp/FZz/jffcQcxnV+m/FtRliNjNzKHJmlnHA+iENSIjPbQH+R00mA4TiKkpw8A2clo+1iU4gLuOqClmK762CbtIsWYpphKtRQZ5zCOh9W1te3C5zxVFkjLURapC9QFHBCMy8+jhVD45/sx6TByTsNoFAUZLgjIDgRlG0/F+I3E9gvZIbGrAumzeU6HgY2glhvx+pZENcfVhwNMz5pzqa1xL7iSqlHS/CG1+51DWul0gyE32SSKKLuKuyf3D73CmC3Q5yDb9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCD1fMOcZn5eTXLK/XzavxCKdMXx/Lv2aZhE2pTKLNw=;
 b=UbXdlRBUde10Ih5uVf0UEOOM/1O75uUr32mIDajqaQ5r/IoVO7Zbz0DjgyNt6kXhMQ3ATu5RbvYGtSkGo/cQLd8Mg8DPPVRvIm3DkXdc87sKd9/nV7l0zvCU/V9k/V8HTOteSmcGaFDlTuTUp8M4UbrJdvog5nClMXKLFSHia4GfJ2ynNpbYkqC2NlbxWElfFfHh1daqxE6PbVrElmrZMeIs2BljRrux9yHwmUqKQYJeb8puAqVBiXFfzmCM0fiL1Icv+1JxM5kHl1RLZi7TbbxkS6+PEAFHJUT2ODpGEbBqST6cYBL30s4htBQBmyKg6rRmMfIk/FLy4OJaIAD5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCD1fMOcZn5eTXLK/XzavxCKdMXx/Lv2aZhE2pTKLNw=;
 b=MGVG/Jb9pSdFgAzwsbmSBro/mo0OGyB9OpzL1Znadn15ywk4wlQnPlk6Rg9lo79eGhjPClVzmeKfUXNnJnOahzXoz0sU1ldt5vrbBkvU9WJIvFfG+N/xDrGlPXbEfbL9WGbZaekkd+mgBgJ8ZAKmpGxOb5gNZ2ZwUBbac2g9s34=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB4474.namprd02.prod.outlook.com (2603:10b6:5:2b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.24; Thu, 18 Jun 2020 16:56:57 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::88fe:438e:4d0d:a77e]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::88fe:438e:4d0d:a77e%7]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 16:56:57 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Robert Hancock <hancock@sedsystems.ca>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Michal Simek <michals@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: RE: [PATCH v2] gpio: xilinx: Add interrupt support
Thread-Topic: [PATCH v2] gpio: xilinx: Add interrupt support
Thread-Index: AQHWQBCh9oBUoMrG60CrVlna3muUgqjeomtQ
Date:   Thu, 18 Jun 2020 16:56:57 +0000
Message-ID: <DM6PR02MB53867780C1A5C044B5CABBBDAF9B0@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <20200611164953.37039-1-hancock@sedsystems.ca>
In-Reply-To: <20200611164953.37039-1-hancock@sedsystems.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: sedsystems.ca; dkim=none (message not signed)
 header.d=none;sedsystems.ca; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [106.76.218.110]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 38cc183c-3845-4378-1451-08d813a89cb9
x-ms-traffictypediagnostic: DM6PR02MB4474:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB44747D562FE8FC13BD6B80FEAF9B0@DM6PR02MB4474.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2e6d4Ih6tkXtVfNC+1n8SDp/CMJXXAj90RrN58z6obporIS8hC8jXIDXvaQ4EaBZiSmiiJBwgay3iwNd6vviTlRCLZ0IHobmQRINlrgkiOlFxy4lWM7SC2W/EHkP/XyltQTBP6IAntRrJg5pIaGxGjIVINOOZvw5REXsoc/UnGQt1G1jyoIph/swyvt0Jqwr4KnY+yoC1eX8kpg65e38ouHUhs/2dGKp/dl/bwD8DUKEID2dAMFEGnS9amnudm4+MxlhJ6umGTPVBqyZo4BT7v+nTEixWhvtwKqqQ+9uW7o2cTkuzT4UJzzsV9yCPzLz+K/qC/zxmcZ9gMkdLk5QLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39860400002)(346002)(136003)(376002)(366004)(71200400001)(83380400001)(478600001)(76116006)(53546011)(52536014)(66446008)(6506007)(64756008)(86362001)(66946007)(186003)(66476007)(66556008)(26005)(107886003)(33656002)(2906002)(9686003)(4326008)(54906003)(55016002)(30864003)(110136005)(5660300002)(316002)(7696005)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ovrcjIbjdNwWp632Uxa6Ez3q8aWIbP79Fbtuf87oY7Rql0ba+xHfcNHtGVxA7TDn8NVms5zEfsWFRCmc690F1NpuOiG99gphH/AkYya7nMSsqm00DpgCRG/UCrixiL+6IWbqGKZcts2cNZiHdZXyzHqpsjboObwFkeCdw1tXhHHMeJaA7tZFUks1FqCY2eCeFHcE14xNWj4TzRx80QJ/Zqv89bAqEEZxtFBiMeHVm1C6h877u6fj84whOrYVYPCrl9vipu1pKsTFZBNJ059/rCJ2peew9kFyWV+01aDFRX6Dn0gSky1l6yqlyggjk6OjTh+1QZV7b3hfCmvf1raIWb5B3fIwcf1y2sTl7i4HrTAEH8LHHKukhAtw73waw5/owvd1miARUavDnE/UwsgDFJn/5xCY8KElGhasBIKS5EQI6nbIeB7+J1/HJ6fbZaCrIkBB1QFuoTqFZuYldo7B6E+zBNlPiPFe0yEjycvo5eiCbBVvXACjo6G0bKO3Ne7n
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cc183c-3845-4378-1451-08d813a89cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 16:56:57.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l76HelqEJtKGRRWcRwRCaWByliBAMjeqzwD45VsEY+WdKBAFgq+B2MUTCSZGqYXo+oXOKevOT8Rua2mpLWzrPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4474
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for patch.

After addressing Daniel comments will go for testing.

Due to(COVID-19)situation we are working from home, as no board access it w=
ill take some time to complete all the required testing on HW.

Will update you once we complete the testing.

Thanks
Srinivas Neeli

> -----Original Message-----
> From: Robert Hancock <hancock@sedsystems.ca>
> Sent: Thursday, June 11, 2020 10:20 PM
> To: linux-gpio@vger.kernel.org
> Cc: linus.walleij@linaro.org; bgolaszewski@baylibre.com; Michal Simek
> <michals@xilinx.com>; Srinivas Neeli <sneeli@xilinx.com>; Robert Hancock
> <hancock@sedsystems.ca>
> Subject: [PATCH v2] gpio: xilinx: Add interrupt support
>=20
> Adds interrupt support to the Xilinx GPIO driver so that rising and falli=
ng edge
> line events can be supported. Since interrupt support is an optional feat=
ure
> in the Xilinx IP, the driver continues to support devices which have no
> interrupt provided.
>=20
> These changes are based on a patch in the Xilinx Linux Git tree,
> "gpio: xilinx: Add irq support to the driver" from Srinivas Neeli, but in=
clude a
> number of fixes and improvements such as supporting both rising and falli=
ng
> edge events.
>=20
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>=20
> Changes from v1: Changed platform_get_irq to platform_get_irq_optional
>=20
>  drivers/gpio/Kconfig       |   1 +
>  drivers/gpio/gpio-xilinx.c | 247 ++++++++++++++++++++++++++++++++++-
> --
>  2 files changed, 233 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> bcacd9c74aa8..5f91e7829fb7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -652,6 +652,7 @@ config GPIO_XGENE_SB
>=20
>  config GPIO_XILINX
>  	tristate "Xilinx GPIO support"
> +	select GPIOLIB_IRQCHIP
>  	help
>  	  Say yes here to support the Xilinx FPGA GPIO device
>=20
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c inde=
x
> 67f9f82e0db0..b759e34438dd 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -14,6 +14,9 @@
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
>=20
>  /* Register Offset Definitions */
>  #define XGPIO_DATA_OFFSET   (0x0)	/* Data register  */
> @@ -21,6 +24,11 @@
>=20
>  #define XGPIO_CHANNEL_OFFSET	0x8
>=20
> +#define XGPIO_GIER_OFFSET      0x11c /* Global Interrupt Enable */
> +#define XGPIO_GIER_IE          BIT(31)
> +#define XGPIO_IPISR_OFFSET     0x120 /* IP Interrupt Status */
> +#define XGPIO_IPIER_OFFSET     0x128 /* IP Interrupt Enable */
> +
>  /* Read/Write access to the GPIO registers */  #if
> defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86)
>  # define xgpio_readreg(offset)		readl(offset)
> @@ -35,17 +43,27 @@
>   * @gc: GPIO chip
>   * @regs: register block
>   * @gpio_width: GPIO width for every channel
> - * @gpio_state: GPIO state shadow register
> + * @gpio_state: GPIO write state shadow register
> + * @gpio_last_irq_read: GPIO read state register from last interrupt
>   * @gpio_dir: GPIO direction shadow register
>   * @gpio_lock: Lock used for synchronization
> + * @irq: IRQ used by GPIO device
> + * @irq_enable: GPIO irq enable/disable bitfield
> + * @irq_rising_edge: GPIO irq rising edge enable/disable bitfield
> + * @irq_falling_edge: GPIO irq rising edge enable/disable bitfield
>   */
>  struct xgpio_instance {
>  	struct gpio_chip gc;
>  	void __iomem *regs;
>  	unsigned int gpio_width[2];
>  	u32 gpio_state[2];
> +	u32 gpio_last_irq_read[2];
>  	u32 gpio_dir[2];
> -	spinlock_t gpio_lock[2];
> +	spinlock_t gpio_lock;
> +	int irq;
> +	u32 irq_enable[2];
> +	u32 irq_rising_edge[2];
> +	u32 irq_falling_edge[2];
>  };
>=20
>  static inline int xgpio_index(struct xgpio_instance *chip, int gpio) @@ =
-110,7
> +128,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, =
int
> val)
>  	int index =3D  xgpio_index(chip, gpio);
>  	int offset =3D  xgpio_offset(chip, gpio);
>=20
> -	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> +	spin_lock_irqsave(&chip->gpio_lock, flags);
>=20
>  	/* Write to GPIO signal and set its direction to output */
>  	if (val)
> @@ -121,7 +139,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned
> int gpio, int val)
>  	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>  		       xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
>=20
> -	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> +	spin_unlock_irqrestore(&chip->gpio_lock, flags);
>  }
>=20
>  /**
> @@ -141,7 +159,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc,
> unsigned long *mask,
>  	int index =3D xgpio_index(chip, 0);
>  	int offset, i;
>=20
> -	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> +	spin_lock_irqsave(&chip->gpio_lock, flags);
>=20
>  	/* Write to GPIO signals */
>  	for (i =3D 0; i < gc->ngpio; i++) {
> @@ -152,9 +170,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc,
> unsigned long *mask,
>  			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>  				       index * XGPIO_CHANNEL_OFFSET,
>  				       chip->gpio_state[index]);
> -			spin_unlock_irqrestore(&chip->gpio_lock[index],
> flags);
>  			index =3D  xgpio_index(chip, i);
> -			spin_lock_irqsave(&chip->gpio_lock[index], flags);
>  		}
>  		if (__test_and_clear_bit(i, mask)) {
>  			offset =3D  xgpio_offset(chip, i);
> @@ -168,7 +184,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc,
> unsigned long *mask,
>  	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>  		       index * XGPIO_CHANNEL_OFFSET, chip-
> >gpio_state[index]);
>=20
> -	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> +	spin_unlock_irqrestore(&chip->gpio_lock, flags);
>  }
>=20
>  /**
> @@ -187,14 +203,14 @@ static int xgpio_dir_in(struct gpio_chip *gc,
> unsigned int gpio)
>  	int index =3D  xgpio_index(chip, gpio);
>  	int offset =3D  xgpio_offset(chip, gpio);
>=20
> -	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> +	spin_lock_irqsave(&chip->gpio_lock, flags);
>=20
>  	/* Set the GPIO bit in shadow register and set direction as input */
>  	chip->gpio_dir[index] |=3D BIT(offset);
>  	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
>  		       xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
>=20
> -	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> +	spin_unlock_irqrestore(&chip->gpio_lock, flags);
>=20
>  	return 0;
>  }
> @@ -218,7 +234,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsign=
ed
> int gpio, int val)
>  	int index =3D  xgpio_index(chip, gpio);
>  	int offset =3D  xgpio_offset(chip, gpio);
>=20
> -	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> +	spin_lock_irqsave(&chip->gpio_lock, flags);
>=20
>  	/* Write state of GPIO signal */
>  	if (val)
> @@ -233,7 +249,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsign=
ed
> int gpio, int val)
>  	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
>  			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
>=20
> -	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> +	spin_unlock_irqrestore(&chip->gpio_lock, flags);
>=20
>  	return 0;
>  }
> @@ -256,6 +272,186 @@ static void xgpio_save_regs(struct xgpio_instance
> *chip)
>  		       chip->gpio_dir[1]);
>  }
>=20
> +/**
> + * xgpio_irq_ack - Acknowledge a child GPIO interrupt.
> + * This currently does nothing, but irq_ack is unconditionally called
> +by
> + * handle_edge_irq and therefore must be defined.
> + * @irq_data: per irq and chip data passed down to chip functions  */
> +static void xgpio_irq_ack(struct irq_data *irq_data) { }
> +
> +/**
> + * xgpio_irq_mask - Write the specified signal of the GPIO device.
> + * @irq_data: per irq and chip data passed down to chip functions  */
> +static void xgpio_irq_mask(struct irq_data *irq_data) {
> +	unsigned long flags;
> +	struct xgpio_instance *chip =3D irq_data_get_irq_chip_data(irq_data);
> +	int irq_offset =3D irqd_to_hwirq(irq_data);
> +	int index =3D xgpio_index(chip, irq_offset);
> +	int offset =3D xgpio_offset(chip, irq_offset);
> +
> +	spin_lock_irqsave(&chip->gpio_lock, flags);
> +
> +	chip->irq_enable[index] &=3D ~BIT(offset);
> +
> +	dev_dbg(chip->gc.parent, "Disable %d irq, irq_enable_mask
> 0x%x\n",
> +		irq_offset, chip->irq_enable[index]);
> +
> +	if (!chip->irq_enable[index]) {
> +		/* Disable per channel interrupt */
> +		u32 temp =3D xgpio_readreg(chip->regs +
> XGPIO_IPIER_OFFSET);
> +
> +		temp &=3D ~BIT(index);
> +		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
> +	}
> +	spin_unlock_irqrestore(&chip->gpio_lock, flags); }
> +
> +/**
> + * xgpio_irq_unmask - Write the specified signal of the GPIO device.
> + * @irq_data: per irq and chip data passed down to chip functions  */
> +static void xgpio_irq_unmask(struct irq_data *irq_data) {
> +	unsigned long flags;
> +	struct xgpio_instance *chip =3D irq_data_get_irq_chip_data(irq_data);
> +	int irq_offset =3D irqd_to_hwirq(irq_data);
> +	int index =3D xgpio_index(chip, irq_offset);
> +	int offset =3D xgpio_offset(chip, irq_offset);
> +	u32 old_enable =3D chip->irq_enable[index];
> +
> +	spin_lock_irqsave(&chip->gpio_lock, flags);
> +
> +	chip->irq_enable[index] |=3D BIT(offset);
> +
> +	dev_dbg(chip->gc.parent, "Enable %d irq, irq_enable_mask 0x%x\n",
> +		irq_offset, chip->irq_enable[index]);
> +
> +	if (!old_enable) {
> +		/* Clear any existing per-channel interrupts */
> +		u32 val =3D xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET)
> &
> +			BIT(index);
> +
> +		if (val)
> +			xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET,
> val);
> +
> +		/* Update GPIO IRQ read data before enabling interrupt*/
> +		val =3D xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
> +				    index * XGPIO_CHANNEL_OFFSET);
> +		chip->gpio_last_irq_read[index] =3D val;
> +
> +		/* Enable per channel interrupt */
> +		val =3D xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
> +		val |=3D BIT(index);
> +		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, val);
> +	}
> +
> +	spin_unlock_irqrestore(&chip->gpio_lock, flags); }
> +
> +/**
> + * xgpio_set_irq_type - Write the specified signal of the GPIO device.
> + * @irq_data: Per irq and chip data passed down to chip functions
> + * @type: Interrupt type that is to be set for the gpio pin
> + *
> + * Return:
> + * 0 if interrupt type is supported otherwise otherwise -EINVAL  */
> +static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int
> +type) {
> +	struct xgpio_instance *chip =3D irq_data_get_irq_chip_data(irq_data);
> +	int irq_offset =3D irqd_to_hwirq(irq_data);
> +	int index =3D xgpio_index(chip, irq_offset);
> +	int offset =3D xgpio_offset(chip, irq_offset);
> +
> +	/* The Xilinx GPIO hardware provides a single interrupt status
> +	 * indication for any state change in a given GPIO channel (bank).
> +	 * Therefore, only rising edge or falling edge triggers are
> +	 * supported.
> +	 */
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		chip->irq_rising_edge[index] |=3D BIT(offset);
> +		chip->irq_falling_edge[index] |=3D BIT(offset);
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		chip->irq_rising_edge[index] |=3D BIT(offset);
> +		chip->irq_falling_edge[index] &=3D ~BIT(offset);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		chip->irq_rising_edge[index] &=3D ~BIT(offset);
> +		chip->irq_falling_edge[index] |=3D BIT(offset);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	irq_set_handler_locked(irq_data, handle_edge_irq);
> +	return 0;
> +}
> +
> +static struct irq_chip xgpio_irqchip =3D {
> +	.name           =3D "gpio-xilinx",
> +	.irq_ack	=3D xgpio_irq_ack,
> +	.irq_mask       =3D xgpio_irq_mask,
> +	.irq_unmask     =3D xgpio_irq_unmask,
> +	.irq_set_type   =3D xgpio_set_irq_type,
> +};
> +
> +/**
> + * xgpio_irqhandler - Gpio interrupt service routine
> + * @desc: Pointer to interrupt description  */ static void
> +xgpio_irqhandler(struct irq_desc *desc) {
> +	struct xgpio_instance *chip =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
> +	u32 num_channels =3D chip->gpio_width[1] ? 2 : 1;
> +	u32 offset =3D 0, index;
> +	u32 status =3D xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
> +
> +	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
> +
> +	chained_irq_enter(irqchip, desc);
> +
> +	for (index =3D 0; index < num_channels; index++) {
> +		if ((status & BIT(index))) {
> +			unsigned long rising_events, falling_events,
> all_events;
> +			unsigned long flags;
> +			u32 data, bit;
> +
> +			spin_lock_irqsave(&chip->gpio_lock, flags);
> +			data =3D xgpio_readreg(chip->regs +
> XGPIO_DATA_OFFSET +
> +					     index *
> XGPIO_CHANNEL_OFFSET);
> +			rising_events =3D data &
> +					~chip->gpio_last_irq_read[index] &
> +					chip->irq_enable[index] &
> +					chip->irq_rising_edge[index];
> +			falling_events =3D ~data &
> +					 chip->gpio_last_irq_read[index] &
> +					 chip->irq_enable[index] &
> +					 chip->irq_falling_edge[index];
> +			dev_dbg(chip->gc.parent, "IRQ chan %u rising 0x%lx
> falling 0x%lx\n",
> +				index, rising_events, falling_events);
> +			all_events =3D rising_events | falling_events;
> +			chip->gpio_last_irq_read[index] =3D data;
> +			spin_unlock_irqrestore(&chip->gpio_lock, flags);
> +
> +			for_each_set_bit(bit, &all_events, 32) {
> +				generic_handle_irq(irq_find_mapping(
> +					chip->gc.irq.domain, offset + bit));
> +			}
> +		}
> +		offset +=3D chip->gpio_width[index];
> +	}
> +
> +	chained_irq_exit(irqchip, desc);
> +}
> +
>  /**
>   * xgpio_of_probe - Probe method for the GPIO device.
>   * @pdev: pointer to the platform device @@ -291,7 +487,7 @@ static int
> xgpio_probe(struct platform_device *pdev)
>  	if (of_property_read_u32(np, "xlnx,gpio-width", &chip-
> >gpio_width[0]))
>  		chip->gpio_width[0] =3D 32;
>=20
> -	spin_lock_init(&chip->gpio_lock[0]);
> +	spin_lock_init(&chip->gpio_lock);
>=20
>  	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
>  		is_dual =3D 0;
> @@ -313,8 +509,6 @@ static int xgpio_probe(struct platform_device *pdev)
>  		if (of_property_read_u32(np, "xlnx,gpio2-width",
>  					 &chip->gpio_width[1]))
>  			chip->gpio_width[1] =3D 32;
> -
> -		spin_lock_init(&chip->gpio_lock[1]);
>  	}
>=20
>  	chip->gc.base =3D -1;
> @@ -336,6 +530,29 @@ static int xgpio_probe(struct platform_device
> *pdev)
>=20
>  	xgpio_save_regs(chip);
>=20
> +	chip->irq =3D platform_get_irq_optional(pdev, 0);
> +	if (chip->irq <=3D 0) {
> +		dev_info(&pdev->dev, "GPIO IRQ not set\n");
> +	} else {
> +		u32 temp;
> +
> +		/* Disable per-channel interrupts */
> +		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, 0);
> +		/* Clear any existing per-channel interrupts */
> +		temp =3D xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
> +		xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, temp);
> +		/* Enable global interrupts */
> +		xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET,
> XGPIO_GIER_IE);
> +
> +		chip->gc.irq.chip =3D &xgpio_irqchip;
> +		chip->gc.irq.handler =3D handle_bad_irq;
> +		chip->gc.irq.default_type =3D IRQ_TYPE_NONE;
> +		chip->gc.irq.parent_handler =3D xgpio_irqhandler;
> +		chip->gc.irq.parent_handler_data =3D chip;
> +		chip->gc.irq.parents =3D &chip->irq;
> +		chip->gc.irq.num_parents =3D 1;
> +	}
> +
>  	status =3D devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
>  	if (status) {
>  		dev_err(&pdev->dev, "failed to add GPIO chip\n");
> --
> 2.18.2

