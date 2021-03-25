Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCFC348BDC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhCYIr1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:47:27 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:39193 "EHLO
        esa2.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCYIq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616662015;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yVaihSFmEKkBrt/xp2nkaRY8swI2njLN4ZHUuUyec2E=;
  b=ApapTdMP1vVNp25E5QYbZEYMAfm648CU8LkxrJQ5FogIl2f+Cv1M9Ee7
   lM8lpZd9xTq847zXO1PKVDvNCJGlbu1veQUetzES6zYty4e+ycQEJuMQ4
   U3FXmhv1Ptwpbeqo2ur2MgEJMT18VUvBHbBIr2fqgh0Io1cGW+63AylQ/
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: B0DCIHX4wm/iYDzV/HeLei4AD0v3qrW068QO0jSjNH8BL+PFxCFbBT1R68pJW6s/tJu6gQYziL
 CMmU7lqjEm1BNzEGlBYheDFKNdiwTsdXJEKIkeHSpbgMUt3MKzJm6woRUlBIWD0e3fAvISXrl6
 iO/XKgHYv5VcqB0zlB6gUeXu3NXwgT30cmXvVBdTTYk56P/uB/eLOMVKueo2elSrolg+esut26
 kG+x6EkNoeI0/gm49hveJt3WBTpS3XRh4m9DpIJPe0FkUre5caaZpJd5oca0sLeLbWvRuQRC8h
 sCg=
X-SBRS: 5.2
X-MesageID: 40102134
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nTa9GK87CfnSfeyz1Rhuk+FGcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2CmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXHOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLoois2eTVJ3Lsk7C
 z5gxX0j5/Tyc2T5z398yvo75pQkMb80dcrPq2xo+UcNzmEsHfMWK1PQLuH1QpFxN2HyFFvq9
 XUpgdlAsIb0QKvQkiQgT/Anzbtyywv7XiK8y7qvVLGrdbiTDw3T+pt7LgpCifx0EYrsNFi3K
 8j5Qvw3PA7fHCw/lWJ2/HyWx5njUayq3Y5+NRj9EB3aocCdKRX6bUW4UI9KuZxIAvB9IslHO
 NyZfusncp+TFXyVQG/gkBfhPaoXng1Ay6cRFkDtsG/w1Ft7QFE5npd68oFknga8pUhD7FC+u
 TfK6xt0IpDV8kMcMtGdas8aPryLlaIbQPHMWqUL1iiPKYbO0jVo5qyxLku/umldLEB0ZNaou
 WPbHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo7Bkp7zVXtPQQG2+YWFrt/Hlj+QUA8XdVf
 r2EolRGeXfIWznHpsM9xHiWqNVNWIVXKQuy5cGcmPLhviOBpzht+TdfvqWDqHqCywYVmT2BW
 ZGcyP0IOlG80C3Sl71iBXcQBrWCw7C1KM1NJKf0/kYyYALOIEJmBMSk06F6saCLiAHkqFeRj
 o6HJrX1oeA4UWm92fB6GtkfjBHCFxO3bnmW3RW4SsDM0b+d6c/q8ySEFoimEevF1tadYf7AQ
 Rfr1N49eacNJqL3x0vDNqhLya8g2YMommJC7MRgLeK68ugWp5QNOdpZIVBUSHwUzBlkwdjr2
 lOLCUeQFXEKz/ogaK5yLoOBO/ecNF4qByxIdFdrE/esUn0n7BtelIrGxqVFeKHiwcnQDRZwn
 dr9bUEvbaGkTGzbVckjP8AK11KYmSPCLdgBACIDb8k3YzDSUVVdyOnlDaagxY8di7P+18Jjm
 LsFyGSZMrGG0FQoHxez6bs/m5lb2n1RTMDVllK9alGUUjWsHd61uGGIpC+1GaccXMu6OAQOj
 OtW0pYHipeg/SMkDKFkjeLEnsrgqg0NuvGFbI5bvX4wXW2MrCFkqkAAt5Z9JtoL8rVr+cOSO
 6TEjXlag/QOqcM4UiyqXkkMiUv9yVhvvPsxRH/7G+3mFQ4GuHfJVx6R7cdZ/GQhlKUMMqg4d
 Fct5YSu+D1D0DaLvih4ovTZyRYKhzSrXWtJttY4ax8jOYXjv9LA5LfUTH0z3lJ0xU1EdfsmC
 olMdBGyYGEHrUqQtcbdC1Y9Gc4jdijLEMktQrtH+81FGtd+UPzDpes47DSr6AoDVDEjAzsOU
 OH+yk1xYaOYwKzkZobAbk3O2JYdQwV72lj5vqLc8n1BB+xf+9OuHq8PXnVSs4RdIG1XZERpA
 19+deGgqu+cDf5whnZuX9DGZ11mlzXCP+aMUarAu5H89uzJFSKjO+L2aeI/UnKYAr+TV8Zi4
 1DfVEXdeJZhFAZ/dQK7hQ=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40102134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bca2mcanGMyjtolbW8lqvr8hpakZjxlfxJ2qmNrXruNEsXkI/n5suJ5RNVfKLxpah9ewiezl9pKn0wLTvZXse9nu4ucqUfAn5H1Ie9qh/vc3AwFWXAUuJg20g3lk6GGVUx4lzvm2gFp9G5CPYOWYER57FVu+cA5po/JBilVXDXgk/SHwgs5K26BdiZhssluV4Jr8NGHzZ3zOKREwHg/aout/ZIKP4pyH5b5JIKzMLN5qWHOQPChi1YIBYOCgCR350Tl3U/Bx/5gjL+CIjZRLo9qQ0NSTAPKmjLznHkOCjNVDPodCHliCbFloD7ieVqiJd5vsjc0A4A4e398PXhDXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pH94whoYKNlTpf6SIE/WeL/oLwmFP7iUQ7oN3PBZKI=;
 b=SNIgD8WZdxzuP4v8DoNDSgIOat9T7gq64VfeBlauPjDbRm2d/TJYs3/pJ/kXiOXq4EsXSmfGmMomxsolNUkHX9bob0HHfGKxXRYjowYxGGoqOap4ImPNjCBi2PWDupuL5EAhgo2mYTtv9gmoDsI5ywUENQzwyyXwQULCU5V1XBkr8soCn+36AitesX13wBzvQqU8hDKgPNvRX7iWGvxOvPnbhPkKfT30ak5gY1mWobqiQDfl7GN5XOyGvnsWq4WRnPFBQmzIhFtCYaKJHlH5v7MKPeDNUuNCj4G2f00VtQr4rxmTLagDNv4QjJeoIT7T6lL81INk8gatzyWSLn2U7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pH94whoYKNlTpf6SIE/WeL/oLwmFP7iUQ7oN3PBZKI=;
 b=XPJLPJJP5fAruTVqXdB9x1jGSS38YntXBzsSH1ccGJLqNEd8qINnUISdotB1STHzX11F7eOhSVvQIqMSOwmCkeHAJrZJSe/dupXejaSWiu7XjNzwQXNmG74CtdNeSIFEaycGoAc7QNJUgJvZAS4REXp3ozN5wguGF9Rwae8Hp4k=
Date:   Thu, 25 Mar 2021 09:46:46 +0100
From:   Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFxN9hlt0FbOVqML@Air-de-Roger>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com> <YFtEw7qHQKE/4p8t@Air-de-Roger>
 <YFtLNLTrR9wTO41W@smile.fi.intel.com> <YFtXNw8ZKkp82EIH@Air-de-Roger>
 <YFtvaBmnu0GF/7il@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFtvaBmnu0GF/7il@smile.fi.intel.com>
X-ClientProxiedBy: MR2P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5db2cb2-4f26-4c63-8015-08d8ef6a88ee
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5445196B270269B9840339198F629@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmP9yoJf4qkPCdtsMyFTmQk24KY7KTMKg35EVyMfVidAwKrOdp9CLkhNTaaiZ2qF/8qyoUlkXClYI9k5I9W7GUmYku3Zamim4yQ4bcb7NbHZ/lZ236eiAPwA6EfbZ9fqpm7GZxhPuEdBiCX+b9HWZ8P2VL/sh+JDegUTb26PK/hJXIvACQ7z6TvQgKIHFIYsLSATZJMMM1KHHeD4qDkZxCN42Sc1omQcJD2XS8Uq+edLJhFfs91JQtYRWpws1JoyuO7iU34HswRvEN9h5phpMm3JVAEDVAZIYRja1b0P+q72SsxVdV+VlU5gaXR0Pfb4w31YuwIsiSr2QV2jDJr+w+vB38eiVi6ixN7xlgrwTxNNYuWqatoXOulTDrFPPVZVbh/KiLjEpG7vfyoTOhPZnYNeePRWAfXW11E7N3d3hIjcbWkouf/x4TOGWu587H7m/49AnccssNlrqub7VtKj9Eh/er8XNoLwI4lrBKiNO7etfwzHIu+4rFlTHqYPU63HJNSXdCPVgUPxHADnn3pafjdp34Lpi+TVVftAZw9B+2hBuZcsIycDQyMARxxgFE722HIUkxAIJ2uESZZpLCKBycT/x5IMM+f3SI8feWkFOpS9zUfy8O9BTQwSrUyS1bh4z/UoxdPILYcHP5ZfccJVjN/k/JU6iDmDkehq4G6/sB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(6496006)(66946007)(85182001)(16526019)(26005)(4326008)(186003)(33716001)(38100700001)(2906002)(6486002)(8936002)(66556008)(66476007)(316002)(6666004)(5660300002)(86362001)(8676002)(83380400001)(9686003)(6916009)(54906003)(478600001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aUJ1UGR1d1ZIM3hDSmhtTDdpWVpTaWR1U001VEVTVnRGQXpiUlJOZVc5SzRV?=
 =?utf-8?B?ZC9LYXVnaEpPeTFtc0U5eit2c05EOXc4TklNQjlRdUlDTVVpb25ZK2xNYVBk?=
 =?utf-8?B?Y1g0dGpPK0ZiNVNUbUp6YmVYd3VkTjhCdndoRTAvcmFzaTV3cml3MEkvZDNB?=
 =?utf-8?B?eW5tOTNEV21RTWQ3a0xzSHF0TVRtOWZEdmdwNjZWNHFsNDgxTXNWaFZVb3o1?=
 =?utf-8?B?NW5nanZETWRIWXYxMHUrSjNNU1VrWTZpVWN3T0daaVFaMGljMm11ZTRTcXFO?=
 =?utf-8?B?QjBvUUFydWJYcDJ6T011WXYrdWY1Y0FUV1M5ZzY0TXhQek9scjlBWE9hak1s?=
 =?utf-8?B?Z2RkNnFzOExiWnRwcEQ1U3cvOEtRd3E5U0RGWHlkcHB6QUpiaVY0MWQrb0xp?=
 =?utf-8?B?bHdaMmszM04rdEd6Z0NPU254MU83V1A5SHVPdHNQd00zM3Z5VndSVnorV1Qy?=
 =?utf-8?B?dy9kR0hJcEMwcEVTQm1hT3NGSklwSzVHTUVTRHcxWmV2RUZyNDZGbm9ZdC80?=
 =?utf-8?B?ZXVMNm5FMGUrdDFTOEEya052OXlja2RrUmxmMnVqYjFaR1VGbkIyeHpKanhV?=
 =?utf-8?B?L0daa25GMWpOWU5kQ2Z2YnFCVkNzL3pNT0VvTHBqRUp0RDhidEw3Y1NTeWI3?=
 =?utf-8?B?MnBTYmphRG1nNndOaTl6WHp3M2I5S2UrSUdtTU55VGVBN3E2aXRnbGdESXBq?=
 =?utf-8?B?QlFramZEblhtalpma3F3U3JQUHFMOTNiSm15UXdGSDREWVo5NGdlMHZvNDNH?=
 =?utf-8?B?S0tPZjRyTlcyZjZ5bmYwdzRydHZYaXBUcWJIbHhZU0VUVUM1S1dzdWhGWWdh?=
 =?utf-8?B?QmNkVTZ2Q3AxV3hCMStubWpwT3F1blQvRUZRNTlobTk1RmtYSjNSNG03anpC?=
 =?utf-8?B?RnNIZ2JYSTBkV1l4ZDdJK2t6ODYwdVNIUjJSQ3JJaE01Q2s1Q0REQ2hSb0k1?=
 =?utf-8?B?OHpNRU9zQUdua1FFZkJML3ZwaDh2TndRZkVvQVFnWFNhVmcwb3dSaHBrcngx?=
 =?utf-8?B?S1NhYS9TSXBJRnkvMFM1RnI2N0FQMVpxY0lXOHdFanBnWStqOXljVElrWWo2?=
 =?utf-8?B?dHRHRlYyNDVBUXlZT09VSEpEM3FmY0lIYURLMHBnaUdpMkl0ejdkbEhWSWpX?=
 =?utf-8?B?QU13NjNRUHoxb0FiVHkyYnZ5NGVnSEpnYlhIOFB6V0RHSDYzK2ZGYnZBZ1Iy?=
 =?utf-8?B?NTM4Wk00ZVdXT1dhZTEzcVVtZXZMenFwNkxRS1Q2NjVWQ0dxQmtTMXBHODhx?=
 =?utf-8?B?KzZnbE02MGMwc05WQ3NWa3pLbFluTmN6N3BVeURaaVdKVWlGRUhQTkNNQm5E?=
 =?utf-8?B?aEI1YzB2RmlvSkVXV0NUN2NVeUJCWmN1WVhOY0tXZkdzQWVWdC9VSG51NHZs?=
 =?utf-8?B?QUVXMFdPQU9hTlQ0RnRscHRCUjZsYVVNTFFqZGthaDBXbHdkbWlsbVVrcm5U?=
 =?utf-8?B?OWVWRjdEU3Baa3l0eHNOeTVnSHhQdDdYdkhiL2N2MzFlUDY4STl4RGsvRlhq?=
 =?utf-8?B?Uy9vQnd5SUh3OGRlQXdVbEc0VncxR0M0OVZVRkJGSnEvNm5sTU9GaXZpZ3Ix?=
 =?utf-8?B?OS9kN043WHBqWnFWa0dSUnplcTZxd1hvOTBSTlJCNTlJNW5DVTZnN3RoMkx2?=
 =?utf-8?B?S2xOWVN5aU9lblRnMFVCVEY3dlJ6S0oxU3RLMlRBdG1vYlBxUDZMam9LU1dG?=
 =?utf-8?B?Mlp2eVFCMEtBNlFoZUxDN0N1Wng4Rm9SdmN5K29neUU4VGl0V1ZjM0RpeVoy?=
 =?utf-8?B?THRaMmUyUWhQUnlFUmtvWSsyc0pTUVdRanVTV1I0TGVlSHpXeWFLeDB2ZllV?=
 =?utf-8?B?Rk5TOU9GeW9FcDlLT21LQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5db2cb2-4f26-4c63-8015-08d8ef6a88ee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 08:46:51.7740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqEslvq9wy190VfcF8f39BROYygq1F0IVXTkcLcZcYVYjDJA8TSEu2kDGRyC6nB8F19FljOqOgUabTFAAJ0reQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 06:57:12PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 24, 2021 at 04:13:59PM +0100, Roger Pau Monné wrote:
> > On Wed, Mar 24, 2021 at 04:22:44PM +0200, Andy Shevchenko wrote:
> > > On Wed, Mar 24, 2021 at 02:55:15PM +0100, Roger Pau Monné wrote:
> > > > On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > > > > On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:
> > > > > Moreover, it seems you are bailing out and basically denying driver to load.
> > > > > This does look that capability is simply the first register that blows the setup.
> > > > > I think you have to fix something into Xen to avoid loading these drivers or
> > > > > check with something like pci_device_is_present() approach.
> > > > 
> > > > Is there a backing PCI device BAR for those MMIO regions that the
> > > > pinctrl driver is trying to access? AFAICT those regions are only
> > > > reported in the ACPI DSDT table on the _CRS method of the object (at
> > > > least on my system).
> > > 
> > > Unfortunately it does not expose PCI configuration space.
> > 
> > Are those regions supposed to be marked as reserved in the memory map,
> > or that's left to the discretion of the hardware vendor?
> 
> I didn't get. The OS doesn't see them and an internal backbone simply drops any
> IO access to that region.

I'm not sure I understand the above reply. My question was whether the
MMIO regions used by the pinctrl device (as fetched from the ACPI DSDT
table) are supposed belong to regions marked as RESERVED in the
firmware memory map (ie: either the e820 or the EFI one).

> > > > Doing something like pci_device_is_present would require a register
> > > > that we know will never return ~0 unless the device is not present. As
> > > > said above, maybe we could use REVID to that end?
> > > 
> > > Yes, that's good, see above.
> > > 
> > > WRT capabilities, if we crash we will see the report immediately on the
> > > hardware which has such an issue. (It's quite unlikely we will ever have one,
> > > that's why I consider it's not critical)
> > 
> > I would rather prefer to not crash, because I think the kernel should
> > only resort to crashing when there's no alternative, and here it's
> > perfectly fine to just print an error message and don't load the
> > driver.
> 
> Are we speaking about real hardware that has an issue? I eagerly want to know
> what is that beast.

OK, I'm not going to resend this anymore. I'm happy with just getting
the first patch in.

I think you trust the hardware more that I would do, and I also think
the check added here is very minimal an unintrusive and serves as a
way to sanitize the data fetched from the hardware in order to prevent
a kernel page fault if such data turns out to be wrong.

Taking a reactive approach of requiring a broken piece of hardware to
exist in order to sanitize a fetched value seems too risky. I could
add a WARN_ON or similar if you want some kind of splat that's very
noticeable when this goes wrong but that doesn't end up in a fatal
kernel page fault.

Thanks, Roger.
