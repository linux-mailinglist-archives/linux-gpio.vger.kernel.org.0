Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A01347A10
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 14:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbhCXN5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 09:57:46 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:47332 "EHLO
        esa6.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235785AbhCXN5Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 09:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616594245;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8aRvfvxX7/DE29hSEwl7keQw2sOVYe8orExjoJVN/i4=;
  b=OE3PX4Nijc4g+QF+KwflwZeFiluuWbv99HKpFTwPL1nRfINcvE/AM0yk
   6f9Ch4UnYSkJlb7d1CUQ3nw5EEI6NIRK53T0aRLpkviki5iK0GdgNzPg5
   RuZdfvqMmWCAZ2Raz4nRk+KbEz3OKO/Mg14lmHAObP3mJUIAo4Xr9nKyc
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iiyex8+CInkTN71NpwBUt4lVyBZQhguoXbYShG1BQs6lcGpRTgVKdrLhQKP4wIf0xDUhCQmIXw
 DY6KCOBPlMkuSu7+RMoTGZ3gxjz3YH/VcGhku/ybftl3Ll8fHSM6Q8Ei+P3ArnBWRWgAPCXo8Z
 SUE8JFW+Adr+lgmlPirS5f0/tk66iLWgyx8rVvaE2wXhxcgAV59D2Z5PnvuK5zY/wsvob5H/KO
 LYlDqe8FHGAjB9gHpnFNiN+TZULX7VmNVvMZXcbPpcc6L5AJeIODbXZgYoQEALoAMZpGR4o0KA
 5bw=
X-SBRS: 5.2
X-MesageID: 40173344
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rwngPaiirm+xZZD/TJkEXV3fpnBQX0Rw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIjVuL5w/CZ
 aa+45rpyC4f24Wc8S8ARA+LpX+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIy/Z4J92
 /Znwvlopiyqv3T8G6n60b/zbRz3OHgxNxKGdCWhqEuSwnEpw60aO1aKti/lR8vpuXH0idPrP
 DtpFMaM913+zfteAiO0GTQ8i3B9Bpr1HP401+fhhLY0L/EbRY3EdBIi44cUjax0TtZgPhG3K
 hG332UuvNsZHuq9kmNhKmrJmRXv3G5rnY4nekYg2Y3a/pkVJZroZEC50QQKZ8cHUvBmfAaOd
 NzB8LR7us+SyLiU1nluABUsbuRd0V2NBKHTk8eg9eSwjhbkVtopnFotfA3rzMu8okwRIJD4P
 mBGqN0lKtWRstTVq5lAvwdKPHHRlDlcFbpCia/MF7nHKYINzbkrIP22qw84KWPdIYTxJU/tZ
 zdWDpjxCEPUnOrLffL8IxA8xjLTmn4dy/q0Nti659wvaC5bKb3MAWYIWpe0/eIkrE6OIn2Sv
 yzMJVZD7vINm31A7tE2AX4Rt17NWQeassIodw2Mmj+4/7jG8nPjKj2YfzTLL3iHXIPQWXkGE
 YOWzD1OYFu9UaudnjkgAXAen/kd0DllKgAUpTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9fLdrc4+aGjFjz2VyNw3RiOxJbAEoQyq7nSWl2qQgDNF6xVb4Cvt6YaF1DxXfvHG46c+rmVC
 pk43hn86O+KJKdgQo4Dci8D26ch3wP4FWHUokbga/Gwcv+YJs3AtIHVcVKZEv2Pi0wvTwvhH
 ZIaQcCSEOaPCjpk7+ZgJsdA/yaUcJ9jgetKct9smneqk2YmMEqShIgLn2TeP/SpTxraytfh1
 V3/aNaqqGHgyyTJWw2h/l9DEdBc12NALVNDB2MYaJdnryDQnA2cU66wRihzz0jcGvj8Esfwk
 jsNzedd/3wDl1BgXxAyarx/FRodmKSQlJoZhlBwP9APFWDnkw2/f6AZ6K13WfUUFcEz+0HGB
 zuYDcZIGpVtpuK/S/QvAzHOWQtx50oMOCYMa8qdKvL3GixbKeSk7sdIvNS9JF5Fdznv+MRS9
 iDcwuNID6QMZJu5yWl4lIefA96p3kvnam2hFnL7G2k0GU+BvSXClJ8XL0fK8yd6W+hZ/vg6u
 QPsfsF+c+LdkP2YZq67IuSSRhpABbau3S3QOElsoo8h9N7iJJDW73gFQLV33RG1igkJMj6lE
 kiUL12iYqxTrNHTog3QWZl5VInm9SEEVszviH3CuE4e0sxj3WzBaL+35P47Z4uCFaGvg3+JB
 229DBc5e7MW0K4pPQnIpN1BWRdc04n7nt+uMuEao3LEQ2vM8VO5kCzPHP4ULhTTsG+aPgthy
 c/x9GDhOmMcSXknCjWoDtgO6pLt1+dfvnaOnPEJcd4t/qgOVqNhaO24Mm8yBfPIAHLFXgwtM
 libkwfbsNKlz84qpY4uxLCE5DKng==
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40173344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypqeb9KUTd/IbZf6gu7Q12zB9QPODEzyUwTdQKEd5pXrC2R2U5NHQwyWO+0ojM7mFpFFZUNQZWQFu5aIYaw+5R/VCpMuxv98CYm85T+3JM2WmJ8y/2ukLFb0qkCZG6p4Bbvgyiaj/i4YUP6wulsRdClR/jSP7/eMm7x9AWzxD6nRMTQJDUyWz3oytB+/+KxaetBp6vW/spcEA8W80YGPHE/WQuWbK4qLlDDHAEHfoyTZgEckZC5cRQWMawlpHU8gK6f5A6vmDvinmtTpf4FpZaKwHh8b0Pl1nQ60vXSOwqxt7ouAVrt3FitHllndmH7AsR5bjdC7jJupRUtt/jcRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WMi9DWalKfawkgbPzZMmmO0JisHja4ifJZM74rdk5U=;
 b=RJaJMndBXLvF4ZpqeXC6dxFhNTH+HwEpDuPYxEadaY2RbYWLONBzbIKJvBPULmIk/UlkrBma/4cglySSX/vbp6EcYS4SRyplaO2tMEeVCV64XRIaZ5kDbq95oIPrzDsstaMRklK6+eyQu13AHbzL1ey19XchN7Yut3YS0hYPD8E0B1mvVhfs04OsV58ITDyHD+coCCgivQsfVQb0l+fp9OiRmC6rHb6DSSwVn87TRpb851HQJfwIWhWqZKAPblRFiBxngSNiS+VSnm8Y0NV1m/tXgIYoS0nJmBBuCkPJslVRrRn8hAAdlkgXNtmGFFZn/CTJWTBoYp3e2nLFSnB1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WMi9DWalKfawkgbPzZMmmO0JisHja4ifJZM74rdk5U=;
 b=hQoDsn9YxloCOid+ZEgDztt6t2o7Wl5a+cQM6Ubk1FXuAWVYwKvAW0tuJFcosRAt5KJsqNR6qVRRNvpDNp7IUePn6kuoFnXodr5F0N2qRsPHsisRPgyVfJgSGMcf9KzJuUoKsd5gxKH6SMF6S8hkFYOkojZBvQ7h7nhLnt/nbsc=
Date:   Wed, 24 Mar 2021 14:55:15 +0100
From:   Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFtEw7qHQKE/4p8t@Air-de-Roger>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFs3XwOBRGAFyASY@smile.fi.intel.com>
X-ClientProxiedBy: MR2P264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46234069-c4e5-42bc-451f-08d8eecc772a
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-Microsoft-Antispam-PRVS: <DS7PR03MB56086FD8942E9167AFBDD7888F639@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZFg//SnTMxh0qkyAtK9K45HvCOqJc1TMrqkx7GDSdp3imvvZ+u86qS6xGAJz2MPK68aaFuJpB5DRekh6Et9HR/zhY5aRUwJkDJw0QIp4FX9WitsDVtWVRqUkbz8DaSXVvzvi2h5B4ifS4dvYiZxns9I/BAuDgxvM56wgNulLcTvaU6a7ortrPYfjKoek+GdYEsT9zIJCHq7Rbd/133EOstlAUaLDWJJMaB43+dyvrjdmFY7K23by5SFL9BpcOCjzvrXuSPfg0G1s1iG5KL8cF/F+HJIBH5O0qMJYRkSDyMqkYtdpWrCbvCIA2T8S+Vesz07OysEIzAbmc+7LKm5r1i0LPhBTNm7tsgsxI6x0/fr0g6q4iCL6LqpKICfxU6M+ELq8MAdLfOk1Jrb3IOlZT9OV7ae9RARUpTu0rA2wUzk9AkJQAkwcI51ZOYzI9SP2kP4Xrt7VTbAjWPTLuAM0GvV0iDd0VMchUfr68esDs4vxSLVTPrbaor7BCcUXVtq7w6mrFyiigO/4N75HxVaUw3Th9JDr5fdXajBcxWZ9UhendIt1/IZeL/A+umcU1VEpwXLgdi4FSsv7m8GTN3OLGwp6fkATXMSG1yFDuBrB7WxKcEOktLDm4gK8dFuGzzQgHWqFwEC9VaClXjyAmqmvX+kb5kmmI5ISqixeYCd9YJSx4c019q9mO1F/w8uQhKZCfO9lKPTtNp5hK+djyEj1HavERRQPs4J9iNWPiRZYawdDpvja5N7M+kVST1/Fj/7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(8676002)(9686003)(478600001)(966005)(26005)(2906002)(186003)(316002)(956004)(83380400001)(16526019)(33716001)(38100700001)(54906003)(8936002)(4326008)(6496006)(66556008)(66946007)(66476007)(86362001)(5660300002)(6486002)(6666004)(6916009)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1Q2MGR0V09MM0hKV2tRNjB1L3BrbkVxdmNpblFqUGFCRC9BSnNUcGZ6dldn?=
 =?utf-8?B?aW92Tkh6ZmJGU21hVUIrc1FVU0paRjg0cW1NZm9FWklQL0pKcGVobE5CdlI3?=
 =?utf-8?B?dUdtOTc2RTBEMlhnSVNFdHZ5M05LV2RuZ0szWUFqaFZxQ0lqdzE0by9zOHpD?=
 =?utf-8?B?amxBakxtV0o2UHJjaTZtWllIWmZ2MDFZWnNKSjNGSU10cU9ObnhaWThWS0Q1?=
 =?utf-8?B?M0JwbXVGNFNkcm5CTkdFcEVOUTB2a0hsNk4raDFvaDN3a0ZjY0pJUkdPblh4?=
 =?utf-8?B?OU5ZKy8wam5MaTZha2JzRktFSGtkZUpCZjg1RG43Q1d1ZkE3OS9WS3lmK0Zu?=
 =?utf-8?B?SlJCQTRkdU12SndzS0tQZGZud2JQUllaRkt2T1UyTjh6NUJvU3FDTGNlcmpL?=
 =?utf-8?B?a1lMbWVySmorSWhSMkpMQlBiQU5Yd1VOWExxOEh0Y1l5TGErNHNnMFRsay9t?=
 =?utf-8?B?Qmo4aTEwMUcyem96bHY3R2RaaEdFMEwxUXVVZ3J0dnNkMFBEeGVST3VrdGVD?=
 =?utf-8?B?YTI5WUhmeW1zeTQ2S0NZcFNVdkNma1B5TVdFM2Q2bWFaaVBENTA3UVZ4VE00?=
 =?utf-8?B?bXBOZlF4dkV2NlhrNTU1alF6WkMzWXdGdXVqUTA4NjhLQ1RuOVZpZUNqVnZw?=
 =?utf-8?B?TkRrU2tTTURHRlJuL1hnVmNHWjVnYjVLbTFjT0dHdkxlbUl1cWhuY0FUS3p0?=
 =?utf-8?B?YmdhRW0yRzhJcit5WmZ3R3ROdS9DTE5nVUJ6NklrcW5mYVRhYUMxYUFBMWxp?=
 =?utf-8?B?alkvL3BoT3J4OGV6eDgyYUVyQkFreWFrSm1rMFFNTFM3d2Z2cWY1aThCUTJK?=
 =?utf-8?B?Y0JIK2k2dFNha2tFaVdTK1ZzQ3JzNjhlcFB2M3kyYkN2TkpPK1MrdmY3ODQv?=
 =?utf-8?B?amdFb25OREJRbkZrSmZ0RDBmWmZjU1Bza0ovcERPTjdpOVFEdll2T2dVL1JJ?=
 =?utf-8?B?SjJHUmdGZlhLcmZwS2lYYVN6cmtPRHVhSEZNWXB1NnRIdkxMa0tZUWVhT0xw?=
 =?utf-8?B?ejBaV2V4by9sdHNnWDJHOTg1L3JVZndHOFBRYjFGeHVzUzZxbUFhT1RRZ2k2?=
 =?utf-8?B?TlNNQWtHeWExUDBGTjVuVUxkVS9vZW1TWlRUdGhXL01MeVk0VEhjQTNvZ2tw?=
 =?utf-8?B?cFcweEZLNXZxWk5aRjBXcHBCUDIyNXptQXh2WGtsem1LQ2JaWGpzdUVldVNN?=
 =?utf-8?B?UHlaYkZ5b29wLzZ5eXN0WmpPeXIvYnhSUW11Vm52NExRQTFXTGMvcWs3aURy?=
 =?utf-8?B?VTdSVFd1cnhlVUJQNU5FYXJKbFRnTlVsUk9UVS8veEpwU08rMGNEbmhTcHdH?=
 =?utf-8?B?SlBUaGNCM3pMM0VUNm5FKzZSWEZkbUFRUDM3cXFFUlFub0ZxenRNNUZld1pN?=
 =?utf-8?B?Y1YxZ3pacG5nTnUvVDU4WnB3WDhqUEYzOWpjWUlSM3ViWm0weUc5eUhCSmY5?=
 =?utf-8?B?SktkL3ZCS1FWeW4zR3lTb01Xd3RyNlVLWDFFLzl5MlE4NjN3QUdyN0l6WWZK?=
 =?utf-8?B?b1ZtcmlWRFhhMmtGTVg5OXZnRGJOUUVwRXNTbGxZRUxFdjM5cWY0bU5GQW5s?=
 =?utf-8?B?YzQydEwxTVV1c1UraHJqYjRhMHJxTmV6a0JVN3NMc0FRZ2djZTZZNXRMcVRW?=
 =?utf-8?B?VUE5ZkdMVDNuUXE1Q3JwWGlFZ0c5QmVoMVBCd0JEcWkwL3k3WkkwSmpzQzlr?=
 =?utf-8?B?RnJFRW1HcUFmTXhyVnVrSTEwZzZ4T3BTRHVGU2lhbE9UYmphR3pwWGxxNHZl?=
 =?utf-8?Q?h0F+ua32OfFJG5PFh3p/UgVsVq1F6Ru5zW3rdL0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46234069-c4e5-42bc-451f-08d8eecc772a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 13:55:21.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t34VwHlWUbuz4tD1esxb0qMjNWboxbVP5UwX5CtjncpdYWXtXvJtxp9mxWYmX/45K27ti1GPOPNQE3gSx9N1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:
> > When parsing the capability list make sure the offset is between the
> > MMIO region mapped in 'regs', or else the kernel hits a page fault.
> > 
> > This fault has been seen when running as a Xen PVH dom0, which doesn't
> > have the MMIO regions mapped into the domain physical memory map,
> > despite having the device reported in the ACPI DSDT table. This
> > results in reporting a capability offset of 0xffff (because the kernel
> > is accessing unpopulated memory), and such offset is outside of the
> > mapped region.
> > 
> > Adding the check is harmless, and prevents buggy or broken systems
> > from crashing the kernel if the MMIO region is not properly reported.
> 
> Thanks for the report.
> 
> Looking into the code I would like rather see the explicit comparison to 0xffff
> or ~0 against entire register b/c it's (one of) standard way of devices to tell
> that something is not supported.

That can be done also. I think what I've proposed is slightly more
robust, as it will prevent a kernel page fault if somehow the offset
to the next capability is below ~0, but past the end of the MMIO
region. Unlikely I know, but it's not worth a kernel panic.

What could be done is check whether reading REVID returns ~0 and exit
at that point, if ~0 will never be a valid value returned by that
register. I think that should be a separate patch however.

> Moreover, it seems you are bailing out and basically denying driver to load.
> This does look that capability is simply the first register that blows the setup.
> I think you have to fix something into Xen to avoid loading these drivers or
> check with something like pci_device_is_present() approach.

Is there a backing PCI device BAR for those MMIO regions that the
pinctrl driver is trying to access? AFAICT those regions are only
reported in the ACPI DSDT table on the _CRS method of the object (at
least on my system).

Doing something like pci_device_is_present would require a register
that we know will never return ~0 unless the device is not present. As
said above, maybe we could use REVID to that end?

> > Fixes: 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Andy Shevchenko <andy@kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > ---
> > Resend because I've missed adding the maintainers, sorry for the spam.
> 
> I have a script to make it easier: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

Thanks!
