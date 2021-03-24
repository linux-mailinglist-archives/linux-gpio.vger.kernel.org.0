Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CD0347CFD
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 16:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236784AbhCXPux (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 11:50:53 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:38370 "EHLO
        esa3.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236723AbhCXPuu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 11:50:50 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Mar 2021 11:50:50 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616601050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MH2vcgX1iP1YoB7u3Yc9kqwdnVDijhCvJ0ADzJxA2dU=;
  b=hPZR3wATCDlIIsyNfKUpRSlZo34rT6oZ99G/kgBFCIYxTgZptIKyJucC
   sFNIsmTVmpn4VoujBRvCpsHKPiupLYl3i2OC3Tck5d/CfUffnpDDNeRQn
   0OymsPDp5MBO59ZRlEqyaAN9r6/fXcW/rehfUtv1hfOLC9sNS+W9uo9cD
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5rhY5lB0i9CxlOCBdxMMDh3Z094c3due3mky5Yc7WrWa/NNY9LBlsl7VH+QRdHQgvvfaU1qr76
 yJNDxxyNjGRLDlh8ETK9Xy/InOF7mI0GZ+WF6rPabEGsT3//uIk9S19YUh/l40Gs8Q6KcK+CpH
 9xK2Ara4SVYKvGxBbk/UTGburYl5uVMmO/jbQEKwe21k/J8NmoUTcP7hsSVAjnWmTs5CAi0b/c
 BYej6vYJeWlj5QaaoGAPfUBZ2wXXkt9vFA2QBdyRgQ/2EYZwXGCt20+6s1buOSnYTCWFIaJ0dy
 Wes=
X-SBRS: 5.2
X-MesageID: 40018139
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:f2hnHqskKeAC8OSM/cIRMxB57skC8YYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwQeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue7667OSxgAGhIh9U2ynSqlgYSKbySw8zU/d3d0wbkk+X
 XYiACR3MSemtyy1xO07R6r0714g93ko+EzYfCkqs9QETn0jxbtWYIJYcz5gBkQgMWCrGkni8
 PNpRBIBbUB11r0cnuuqRXgnynMuQxek0PK8lOTjXv9rcGRfltTYKAt9OEpEGqt12MasN5xy6
 5N1W6C3qAncC/opyjh+8POEyhji0vcmwtTrccok3ddXYECAYUhy7A3wUU9KuZlIAvKrKojEO
 VoEfjG4udXfV6wfxnizxhS6e3pcXIpEhicRE8e/uSTzjhNhXh8i3AV3coFgx47hd0AYqgBw9
 6BHrVjlblIQMNTRaVhBN0ZSc/yLmDWWxrDPE+bPFyPLtBIB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMynxvRwg1PwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA/fcR+
 24NPttcr/eBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OBZbtssDdbfbPNJvgGTspQQrEcz
 4+dQm2AP8FwlGgW3f+jhSUcWjqYFbD8ZV5F7Wf3+V78vlICqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4U2//WPC6XRVKgNQZ3wlp4nIYjdvn0snIkn0ebEMt5G0YmZJxkaKIRd5UofwHB
 NAoU90vYa6NYaZyyxnK9/PCBPas1Ij4FaxC7sMkKyK4snoPrkiCIw9ZaB3HQLXUzpvmQhrr2
 9HQBQeRlDWEw7vjanNtu1XOMjvM/1HxCu7K89drnzS8W+Go9s0e3cdVzmyFfKMjR0WXDpSjF
 1p+6o5iL6N8Azfb1cXsaAdChlheW6XCLVJAECgaJ9Pkr7mQg12UFyHnCeXkR01Z2rs+XgDn2
 CJF1znRdj7Rn5m/lxI2Kfj9115Ml+QeE99cVhWm4xwH2augAc47ca7Io6Il0eBYFoLxe8QdA
 zfaTwJOwV02pSczxiOgguPEn0g27QjNuHQF64YbrnWw3+hQbf4zJ0uLrtxxtJIJdruuugEXa
 ajYAeTNir/EP5s9AqPpHopURME4UUMoLfN4lnC42e51nJkXqaXD1RiWr0BI9aTq0LjXO2F1Z
 1ljdQz+cu8W1+BHeKu+OXyVXpkLBiWnEudC8cPgrpQtbgptLRyE4LAOAG4n01v7VEbFoPMiE
 gaQK5H+7jPNY9kQtwKd0tijy4UveXKCHFujxf/DeA/d2w8lnP3P9uG5LzTtLoka3fx0jfYCB
 26+y1Z8+ytZVr56ZcqT4YxK39Rck4y9TBL+/6DbZTZDGyRBqx+1Wv/Fn+2a7lGTqeZXZ0Wsx
 Zh+tmN28uabTDx1gyVnTx1JMt1giqaaPL3JAKHAuhT9dOmfXyKn6ux+ca2yA7NdgHTUTVRua
 R1MWoKbspCjTE+jIo4lgiKI5aH3H4Noh95+jFollnkx468xnzUdHs2aTHkvg==
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40018139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9i5+MptozR2K/iNrgQlUaxg/DBa8/q1xPiPc9xKchkfU0HnBE5NjTbafp3MfQqF27W1RZQQlbDoh8wrujc1jJK7785UOped0IP0LHGgv/HEDCVCnJuYWdyRcsHm5U2w2PgfwYD0A59ocvxTVe+69WbLu3ka19YIeIVeymLkeqEA5sScinxxdwL2eMUKg1ottElO9PzQD5Wh57YdTDfuTfWue9L7oqSEmL2oKe2NwHzOFMOU47W51UfBChsdL8uFOLH0ADf6KGHSANoBYgeqlGlv3EJaiEWU68IHz4QkhMCIIApP1m0hmZ1dfXabagYExrG+W9zM70bTr4LY0JuKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq4b7bnXXGYqfMK4UXF62lbfQFGPIykj3uOrnpw+JOE=;
 b=JfJ/uPyyGwDcX/gNbMlQL0UCiW9Ss6ZEQeI8OpIDf2pxhA9sdpBiiRVFENGuZeyj1swPI+uPxv32erZ738vQH/3kABIMZ24r6HAtPePe807xm+8szQk+CpxK2lkmCTIh+OFpOKRG3ZibziRDszt+DTIlHB3ttH8eicT2VNZX/WoJ6ea++mlD0Ku41ZaI3+g0fL8c7ER51cjKjkKuxov/pg10qnC4Rb2CjafgOzAVx97giNt2c27ivhX9VzOi9ble5A0uso6cwWpZ3oEAzsxvTZMdHOcVahfGMxmqPtqEDYtmO/L5P8or8+S7DIDfrzHmOM5rE3V7UYRHpSlWJ6GMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq4b7bnXXGYqfMK4UXF62lbfQFGPIykj3uOrnpw+JOE=;
 b=nGTQXdhNcw2dt1nwIkGJ0AMbSsVii+glgYBZ1FjGoKbaosPUJE6E/zCTwM6+VnUlRC/3lXA7HaPdZNqnxmf9yMh7RBICEy/l0vYuQa0jad/3BsdW2Xq9urLaHaTFOveU1+/UkHT3kurKGPnuEG2Cxf4UrH4+8TWRtDYWIyGSYG0=
From:   Roger Pau Monne <roger.pau@citrix.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <xen-devel@lists.xenproject.org>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 1/2] intel/pinctrl: check REVID register value for device presence
Date:   Wed, 24 Mar 2021 16:43:11 +0100
Message-ID: <20210324154312.61878-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210324154312.61878-1-roger.pau@citrix.com>
References: <20210324154312.61878-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7215346-c06c-428e-e61a-08d8eedb98f2
X-MS-TrafficTypeDiagnostic: DM6PR03MB4763:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB47636755F3C1FD68A7DBF3458F639@DM6PR03MB4763.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jcuy9OdhwcZdLmVGDwo+XChUNxH5yBEo+r/tJTkh+m6JpYBuAahywapAZOsL2l8pvgTCAJsS611ZYVTPaNKZjrem6e8AazHBOYtd/+wcTpFvQIQJTnU1Vj9qBmOWDadYWkINKmUbhL/4SxUOFMKsAC4KsH2eiCPQwF8Dq7o5ENgOAT1ms9pQm2PeR+ISht7j7UO+KMAiMv2a28CgR9UN+txUA9XxHakNJb39/sWqMyWy9avts6fcQ+zax4eqJzLpUWpdYeQMRrqVLTxwPVirzQG8SIzULH7/kfFPZEXcRMZ8DJtCfc5lDizOAKPTI/1Iagr+mZkLM/8f8vX4m/aSZiWkYxNzxsJUUIdutBjI4iupKw1lq7c83mfGLUEikTIgrSxEtRJUxcx8DO44kXsD695akoPz0n5qUhk03et/Q81ev/Lyq/yMXxOtvH5DvQmuxinp5lBId7r3OaxjlwCJL9rpJsmp0Og8ZiwrETdRpjqi0qvDnZp0qO0JfuiqPHP46lN2QIlWBM15muNkhAhHt7I6cQAPpjcE77ef2OoraXcHfBklMUVjijkyhxFMGyhg0bezITb3oHlv6BUt11fR36caeYsqvBYItRhPXjMXNO9kQyGDv/5ay81qiRSs05mis8TFlAuXgKZlvZNpgZlQlS4rCLva8Yt4oQHg+7sIyv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(956004)(478600001)(8676002)(186003)(6666004)(4326008)(86362001)(36756003)(16526019)(54906003)(26005)(8936002)(38100700001)(6486002)(316002)(6496006)(2906002)(6916009)(66556008)(66476007)(83380400001)(66946007)(1076003)(2616005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXE0VnBHSjVtalBObUsyMlc4TXY2VkFWTW5QRXJDSytkd09aallRbGFzSFZI?=
 =?utf-8?B?dUFUODZ0Q0Q5QUZMOWZRK3ZPeHdMUHNUZmxiczZwY2ZCQ3lyOGd5bS9kTVZ0?=
 =?utf-8?B?b0I2K2FmeS9OaElRUVBLMzF4Zks4ajRwTFlzNWF3VXFMOU9NN0doWDg1TnZp?=
 =?utf-8?B?dW51cTZ0dGFmNnZ6Q201dDVibHdNUG9zOFUxQUlUazZGL3MwQ051cDBEaFc0?=
 =?utf-8?B?aVR1bmZwWEpKckx3NkszcENIQm8xY0JOV2J5d2RkUUhBS09JL2c1RzBFMUR0?=
 =?utf-8?B?UDcxd1hFZXI3VXNVZUFweU56ejZvdTEyVndTNjA0QjZ0OTkyazVtb2UwbFlR?=
 =?utf-8?B?b0hvSEtzelhvd1FyY0RPWU9yRXNUb3JranlsWjBrOG40Vm5zRW9rQ2l5N2R4?=
 =?utf-8?B?MXhNY2pzVHE2ZEJBakNHQzZQWWwza1RGTXk3R1orOHBqK1A3WG9vZGJHdW5M?=
 =?utf-8?B?anN6a0NRbGtHQm0zV2pLbXRkK1hWMi9Rcmxhb1JSUHZYWXgvc2NXeHgrV2lK?=
 =?utf-8?B?NVBva2M2VklwTU1Mb3lORzM2MVFvdTRkd2xuRytjdHd2aWdQTnFnNjR4NDkw?=
 =?utf-8?B?aGx2QzR6aVlJcEpWdHZWTFpjOTMvU1l4anBJWmZYYTU0TmJXcmh2N1JNTGYy?=
 =?utf-8?B?Ti8rT0ZuYVlJMHZMWTR5RUd4elIyNUQ3QUdqeGdOVzBzNVJONUxxZTB6ODl4?=
 =?utf-8?B?NXVNd0JNZjl5L2VlK2pzUkhHSXc0VkFEb1JuTCtCRXlTM0NRMHBDOVdRYzRE?=
 =?utf-8?B?Zng0QmFjdDlwdmZ1TEdEZWpxMVdqSTVLcDJoNFRvRzlIYkQ5SldKZktHKzcz?=
 =?utf-8?B?MUlVRldWQTFjK24zVE5DNUV6bFh4MU0yV1EvcUlkQjNFWHRpdVQrUGJPUFNl?=
 =?utf-8?B?UmVITmdTYmY4Tks5WW05My9LMVpDWktoVURlV0hIS0doWVJiQVNUeGtUSmtJ?=
 =?utf-8?B?RmhtMC9UK1NUSkM2cHdrZm5saldwUHhMMkM5UVE3QXVYVVdpMHBicjE3R08z?=
 =?utf-8?B?MEt4cXJCbW5oK2tnR1JDbjAyT0p1WjJoRWtBL0c3TEZZcXlZdi9sK1ovYXhS?=
 =?utf-8?B?R014bXBjSUk0OTg0TGVaWENNTUNmMitpNHdaK2duN2Nid1IvdlptWC9UdW9L?=
 =?utf-8?B?eVE0ZG5xSDdRZEtsTWRvNVdxWWgxL0V4SjVaMFRHbWhyci9tU0daamQ1TXJw?=
 =?utf-8?B?UzlDZjBtQkFEa2RrSGNxTjNEL3VPN3RNWmJ4MUtIZVA0MXlxZ0FnendsbFBp?=
 =?utf-8?B?cmYwQWJ4M1BiSlNZZlM2eEJjcnI1YyszZTNaYXd1MUpLT0NhbFdGMSsxTkhX?=
 =?utf-8?B?Zmx1bHVNVTlzci9WL3NseWxOb2k0WFNpVU5Eb2NmM2llZnFPV2JPVmZyRW1F?=
 =?utf-8?B?cjdRZWlCNTc1T3lIM2tIL2hTcWwveThwdlo0RTdjYmIyOVdRWVhKV09SZlJQ?=
 =?utf-8?B?WUZBSmdtWjlqdXRVZmNHOWdMaWhYQTd4TkhEN3QwbnBNV3NTdGdXQlRFRDVN?=
 =?utf-8?B?NUx2ZEhmd1pYd29oaENXOEliZmVaSVVvRE9SNGNUeUdNcGhXK2oxN2tOVEly?=
 =?utf-8?B?MXVwenorWTNoaHJiYTkyWGVMVmFZckxMa09PTHZYTDZvZ2lVNzBnWE9jdHY4?=
 =?utf-8?B?TkJ3WEJaMGxFLzlEMHM5VkcvVW0zeFhnTnF5azdGOG9jZzNnaTB2bkJTMUZO?=
 =?utf-8?B?V0FKRDl2RVdNYXlVbElGanIvcURGZHByM3hrcXpCQ2pCYWxEOTNkaXc1Q3BG?=
 =?utf-8?Q?6EedMSy/aWDFAPWhWMKHf4u71x6m2xFGXTfQnaj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7215346-c06c-428e-e61a-08d8eedb98f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 15:43:40.4946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVQw++uW6v06IKC/sH1qabWoQxoIlJO2l5zUWRrZBHZy6eqiK+e0qgxoiYm7rV7cxdxJHhr8vEBvedz8QdZAoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4763
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the value read from the REVID register in order to check for the
presence of the device. A read of all ones is treated as if the device
is not present, and hence probing is ended.

This fixes an issue when running as a Xen PVH dom0, where the ACPI
DSDT table is provided unmodified to dom0 and hence contains the
pinctrl devices, but the MMIO region(s) containing the device
registers might not be mapped in the guest physical memory map if such
region(s) are not exposed on a PCI device BAR or marked as reserved in
the host memory map.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8085782cd8f9..59d13342caf6 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1493,6 +1493,8 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 
 		/* Determine community features based on the revision */
 		value = readl(regs + REVID);
+		if (value == ~0u)
+			return -ENODATA;
 		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
 			community->features |= PINCTRL_FEATURE_DEBOUNCE;
 			community->features |= PINCTRL_FEATURE_1K_PD;
-- 
2.30.1

