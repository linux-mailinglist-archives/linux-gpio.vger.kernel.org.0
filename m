Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452A8348BA1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCYIgk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:36:40 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:63176 "EHLO
        esa5.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhCYIgd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616661393;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mdoXYDJ2mJ3pNru57UQOH75LghTbsmOgIOYvHa5JOHw=;
  b=Zhis16u0tEU8DoVRvEO2YSe/d3mWEtOS6n1fmvSAM5hoVpbnahAOXkz2
   J0dN0mpb3PgZz7QmGn4KXc1o0J3yJE00RWU34oDigIgsNxKJHniqcajGT
   zKbkV0hhSPpss0Wy2RBAHLn+RQHr/kbxNDo7GCjGwBAl+5+hXPuaX5dso
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ga8gCpdqVFu0kc3d7yOxmFoujri0o1YOBS+igN1JkW+SzieYHroDYfQM1Jm60YLwcrIRP/PKwr
 UsB4RYAGwirVHBRgcxU4IQ2I2o+w5yDcqOOiO7ANbK/bnnD8LFfPf1Kj4hS6Ymr3wDArGoLlYl
 yLFrZgnoQ8y0b62X+VWI8DS3wDglrtIa5L7yxxTdmW9d7pOPZ+L4IRO7VhcmVrXpaWuVBlIOEF
 Jn2DohDdBG7brZPRmpj4tvPMFb3VueflQUNZkm/LEbkeqvmC+N3YOJMvPwe2i+oH/9BvKMplL2
 qTw=
X-SBRS: 5.2
X-MesageID: 39975718
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="39975718"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbImrjRSoP8MCaukz8AwKZAu4/fhFIPXDDNeNNAM16QCVnh5EBj0mIFMStm2ku0b9KzZBSCU9nBLIc6z5pi7u1rUZBH6RROmXSAv4jiHuFiPeAe1ZvTqF9Fht1nDUh3hoQ1c1IN9VCcan69mb6eTi6VhgVXuIgbehiKnOhLsW0662yND9P1f4iSFhl/u+VIWyJt1+RIHZ5xlq/uX1FOYol+aBz/mUtfQ0xPK4tr04b1Zy8GWznveVmVuZu5L2FqtbjInUEv7478V6QeC9QjXBAl+kWcPw6muRX/naH/NRBQwmtquyWZ0O75GbQeL7628p0EDgbTcK/Ftf5scbRi+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMseXzzuh3LwxBLdIsHCmwcEHix6OfFdjI2TJF3OQXk=;
 b=H54Z+OH98NDj6Qprh088ECvPt4RQmTYeU6FK1ufyjAGOFt2gVhfiOrRa1nER2Tma0zMJ8i07TX6WDwHAxtE9DclF7T+33Ddh4BIgVVdZ7z6UqzCvc2q8Fwk37bXo4p0/FBCT7cGVEPBfmtVXbPa2oKzuo9ceXwjDWiSGtobpv/stKod1hpVVY4YZGbSry7M2BOf2HpuorrG0LK5edGUKMOoj6qRoATmFat7EH4I06E8HPGa9DRw1/aAmnFIx2OcuvPYTLYYfGjtHF4iHKgdUkjtBHq3SnaR2DPL/J1Fmki9V95rfDR3OPiZbw7Y589eucLYWOs5IhSwLMR1jjC76gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMseXzzuh3LwxBLdIsHCmwcEHix6OfFdjI2TJF3OQXk=;
 b=GSsxHi5sJuWji9o1ZAT2PLZpdK1GN9T4sveirTUYl2MZtAY4COwpXV3KVQatK1JySQQq0rYazg63BDKtbPL4IMNo7XzlPEK4sKRlWQGJHlp+jtz5tc7gbXFq8Z3Xv2viVYYedAQXFzxHibWEA+DynywAiYUSFbD2lrs6H/VcG7Y=
Date:   Thu, 25 Mar 2021 09:36:26 +0100
From:   Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] intel/pinctrl: check REVID register value for
 device presence
Message-ID: <YFxLinaitvUmkMLy@Air-de-Roger>
References: <20210324154312.61878-1-roger.pau@citrix.com>
 <20210324154312.61878-2-roger.pau@citrix.com>
 <YFtwXj1Q+PRO0asv@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YFtwXj1Q+PRO0asv@smile.fi.intel.com>
X-ClientProxiedBy: PR2PR09CA0022.eurprd09.prod.outlook.com
 (2603:10a6:101:16::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 764ea53d-1f10-4480-52d7-08d8ef691735
X-MS-TrafficTypeDiagnostic: DM6PR03MB5289:
X-Microsoft-Antispam-PRVS: <DM6PR03MB52895C9E3B355BC5DB5CC8168F629@DM6PR03MB5289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LEs86qzT0bGUrr1+giCxSZ47A9jm6YIxcalE11CjybEr+a7LwkWO5/rhgb1gmERbI2fKJUpEcURoVaLKjxVReQznKSUxy0jmIkWl2E3LGtmoXcuMJQQtSQTxX7i++bqeLgODIMBl0EuSq8BRQ84k6P2mBu9SyautJE1LRmRZMbGBDSBzEPX+Qg0lBon1aCcAqOpVfA1l9YrUyhIdqGLCkGYBuV1R9LJ/11tzBjIkcXvjTg18KvyO4bzs/o+WfICr/EX4qxt+8qAt1ysUuUlnwpVBWjLj7OpKLswS0li3E2UngQ5d1z+tXEplh771jy0SictKoS156rfnTUyA1g06quEiKZvbwJMutpn2q8ADOrDlOLTDmUO5wCpSX6Ja3vpklCpf54JILFvYKH+JjL+Y9BiEyhd8te1J4AxzRwZQPXLlybY9rFXvd2plxKMy6DN6YwSNFJqWKbSL7P4MLT8Qfz1iLQ2dfCpFJwbDFQr4QJuAlDFWAxFIFGRI2WOPsq2N0LyjIDpWlBAzEMGbaNxQl7Ec+Lc9Gez/ExU4TAdpBR6D0C2tk5N+fEHxe2/xKbcF+ktFPcX5sntNInwfLETNq4hXBm16UeCcktkYrWK3S6hcKwnUljB0z8k8eDHqtA1vT273Hc+cKWx5dNlBr9m3dnlAOWLDWyVm2QpkJ/TJoRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(6666004)(66476007)(16526019)(6486002)(66556008)(5660300002)(2906002)(26005)(66946007)(9686003)(33716001)(186003)(956004)(4326008)(38100700001)(316002)(86362001)(8676002)(6916009)(8936002)(478600001)(85182001)(6496006)(54906003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UVl5WmZRS3JaOHpsV3NCVjgyQktGOW8xSFFxUHo1T2l4WFhGd2tocWpINXlZ?=
 =?utf-8?B?MmFLc0lWaFk0V2grRXkvMzJyL0dlU3dDY2tGMGpNN0gwRy9JaGNicFNFL0ZG?=
 =?utf-8?B?RVpWNjFQck1UeUhWcmdzVjdlNkRjMzF0Q3ptWVE5NFlVelh2MjdmRFhTajBU?=
 =?utf-8?B?Mld2Uzc1Tjh6ZEd5T0NmUUMzMElKeDRXSXVzVkdDN1VodnMrbkc0YkFudVdH?=
 =?utf-8?B?TWUxM0dBZmlXOGtheUhicjZXT1VKMlhITzVtODEwRHduUmxIV3ZFdlNzSzFj?=
 =?utf-8?B?YUNMNlZVWFF5Y0JMODUzR2l1NUZIYTI2L3NrK01LcnRSL043Nk1EWHlVTWpB?=
 =?utf-8?B?bTFHTGFzVnJRN0JBSWxwYlRNcUZtdlBxQWRqNU1VcUJFemg4dXFTbTRXRnZD?=
 =?utf-8?B?MjFVanIyNnJsZXhzMWwwS3VBYmU3WU5kZHFhcnY0M1ZMUmNoc0kwbkdjRzFs?=
 =?utf-8?B?QU9udVVxYnNQaE9kaHUxZXlad0F1aGhzM1lLL0xFNGFtQlY4VjhHSVFCTEJV?=
 =?utf-8?B?Q1liSnZwTDFQNW02NkoxTFFIS3VzY3JFTEdCN0ZXVXpod0k3am5Wc2dnNGU2?=
 =?utf-8?B?OUNBcllVV3BZUHEzMnZxMTRYekZ6czF3ZExxSEl3bEU3U0FrWDRQVHI4QVE0?=
 =?utf-8?B?OWM0TGZQeDc5SUR4MGdpdzVEUTFZT05neHB0K2ttbzJmZjg1S3V0bUx3bkFE?=
 =?utf-8?B?T0ZBNVVpc0tuTUpybnNLQWtJUmM2VFdHWTVVUkpJZFhhMWZGY1RDaURZS3BQ?=
 =?utf-8?B?UlBrbWh5ZmkrWlZ3VWptWGZzeE1GcUg2c3BMT2dSVE95QmVQdytHZHNpRUcx?=
 =?utf-8?B?S2JsUXpWU0E4L2d4M3NFV3kyL1hwZk5WYkdLdHlobUtoZmhhUDJHR0dkTEVx?=
 =?utf-8?B?dU9wRG1tRWswbW1zQ1JmUGJBNHREeG5adjFxM1JIR3hPbHRDK0VBQnRzVWJI?=
 =?utf-8?B?Y1pHc0NFdko2a1dxS0pmamo5L0RVUlhSZkw0UUJiYWU2UVc2WWxRQ2dHRkNk?=
 =?utf-8?B?akNNLzdhclN0dFlyNjNCK2Ric04rN0FyMktzaGtWQUo4UVlSUWRDNHJLL1J3?=
 =?utf-8?B?N1c0aytQV0NMb1dReHFOeTNOTldKeWdsWDAvQUFSV2kwdElwTG5QZlVDTUNT?=
 =?utf-8?B?dGVjM0dPOGo5TkNTVkJ6U2k3N1FsM2drSXNybmRZRllXSEU0RFE5UVRlSmht?=
 =?utf-8?B?bHpXTjQvSU5GREQzOFdrMU5NMUlPWEgrVDIveUMyODhZZTl6ZzBML3BJbGVV?=
 =?utf-8?B?bWlJM0IwaS9GZHBjN1V2YUJ2ekxGcmV6MXhINXh5RC82bjZPbWlEQTVseC92?=
 =?utf-8?B?dndDdzVNbjQ1TCsyNVNjVSt4WGhhNWs0TndqU0hSL0RXOWhnZEdrOW40QzVm?=
 =?utf-8?B?RHJ5YzdvMmg5M00wT0hGdGw2Y2ZsYnNCNGw1YUFzdFlrbnN2MXBEazFHRTFU?=
 =?utf-8?B?QVU2WTNCK0dMUmpvN1MrOEFPdUtjenJiUEVOYm1hYWRrdFlpMXl5K1lyQW1C?=
 =?utf-8?B?NHpoekR2aWFRVjRDdzdaWVZqTm9SRjk1Q01PMzd6ZWVXQTRVUHd5eUVwUG96?=
 =?utf-8?B?cTBPeUZPRUV0aVBoSWxnenpnWkdxUWpKYU5nNFk1clVMd3podVQreHhFMFRx?=
 =?utf-8?B?VDZ4QUhuNmR5N2FNRGxZRnJyYzVZdnlOTGxCZVVaem80ZklBOTJvMFY4TFJ1?=
 =?utf-8?B?QTJqZWR3NWl6VHl5QWg4czFGdUlKNldDTXF5WWMwTnVWWFVMazJZaWV4N0Nw?=
 =?utf-8?B?OWljNnA0bkpudndWMlB4UHlqcnEyQ1VQTWd2cWU5K3hrSEVQMWlCeG1PZVhQ?=
 =?utf-8?B?YTQ5b2g1Qzg1YWNNMys0Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 764ea53d-1f10-4480-52d7-08d8ef691735
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 08:36:31.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1xGzKBtzBSnZh4hZq+JYH3FrQj3AcrWawS7MrW+DGdyM9LeH2ybekHzoO0OkpT6N8YTOvvDzubpKEh3n0a62g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 07:01:18PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 24, 2021 at 04:43:11PM +0100, Roger Pau Monne wrote:
> 
> Thanks for a fix! My comments below.
> 
> > Use the value read from the REVID register in order to check for the
> > presence of the device. A read of all ones is treated as if the device
> > is not present, and hence probing is ended.
> > 
> > This fixes an issue when running as a Xen PVH dom0, where the ACPI
> > DSDT table is provided unmodified to dom0 and hence contains the
> > pinctrl devices, but the MMIO region(s) containing the device
> > registers might not be mapped in the guest physical memory map if such
> > region(s) are not exposed on a PCI device BAR or marked as reserved in
> > the host memory map.
> 
> Any particular point that we can use in the Fixes tag?

Hm, I haven't seen those issues up until 91d898e51e60 ('pinctrl:
intel: Convert capability list to features'), but the device wasn't
working properly for sure, as the registers where not accessible, it
just didn't lead to a kernel crash.

> ...
> 
> > Suggested-by: Andy Shevchenko <andy@kernel.org>
> 
> Hmm... was it that address I have used? In any case I think my @linux.intel.com
> is better.

I just used the same as the one that's on the MAINTAINERS file,
because I already had that n my Cc list. I can change to the @intel
one if that's your preference.

> ...
> 
> >  		/* Determine community features based on the revision */
> >  		value = readl(regs + REVID);
> > +		if (value == ~0u)
> > +			return -ENODATA;
> 
> I think -ENODEV is more appropriate here.
> Also comment above should be adjusted to explain this check.

Right, will change and send v3.

Thanks.
