Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C22347BDC
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 16:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236553AbhCXPOU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 11:14:20 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:42788 "EHLO
        esa2.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236549AbhCXPOJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 11:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616598848;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wG4im1BTW2ovd2UN98LBR1DeI+7tH225IUFzOgweV5g=;
  b=GKzyobrbu4toPJC/MhSEu7XXfmm61vOL2vs6Pr8JyGc7jnzOUFBRUKKY
   s9vRNtnixTzCL6pw67nDGNOyk+V9CIjk/uHcVMVnAmApDYc7J/bAvf94Q
   GWv/wwPRmD6OD+mpG+8gr3XL2AuxNXV0/jx0lAa2+D9EMC8uftY/zhKXL
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WPgl8n6C1t9qqptT2KlYIcusDPet5S6aMpDU2n8dy3iid03VuoyjBToIx4kDSopOuQvyFDwxF3
 1AxeTRbFgHlolX61kz1IsHfkEzbwXkoDCDbc3UbO+G3q6cnbURy0iPgfjqZoPkf1OkGMfB5CcZ
 ERcpJLiHGEz6LPrx9QeI7dv9PbWmTe9PcailXEMCHyZ6o0SQPFzqH16+xypp6HbPSp3qczFtRn
 DoWP/WcfjQhuDQuR+Uue3CWfW6elF0ZIhJ1lPsTQ+ob5hTFwRuRPlcPbVqvJQuJD8gCofZhf/s
 3nM=
X-SBRS: 5.2
X-MesageID: 40034394
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yc9NWqNChxiPE8BcTxP155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEqPoexPh3LRy5pQcOqrnYRn+tAKTXeVfxKbB4xmlIS3x8eZByb
 xtGpIVNPTcBUV35PyU3CCWCNAlqePozImNpcPzi0hgVhtrbaYI1XYdNi++HldtTAdLQboVfa
 DshfZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ9bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUqpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zUwIidDq0nkGup
 3hpAohItRS5hrqDx6IiCqo4SbM+nIP7GLv0lCRi3eLm72GeBsKT/BvqKgcVzmx0TtGgPhMlJ
 hl8kjcir9sSTTHpyj578igbWAQqmOE5UAMvMRWs2ZSSuIlGdlshL1axmx5OrEaEhn37Yg2ed
 Medv301bJtfVSWY2uxhBgX/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv5ks9yA==
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40034394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RN40r+sN9kfv344l5vSEJ6OaOYPkby1+i+EDj9/SpDEyDl3kTIx8tSeqreKf5Ho+ne0pB13I0/fnBNkgvcpvV8OkoW48rNRMh4svK1flHMavv43Z6Ce6rdyAoUC+WvAAhHpeetVcYgdsKPi88Ed1jgMwTAueAGuFfDvOIe0FXugXp347EXxHJP8odlyoc0O6aGeudaDHFC11404LjJRqPaNMudMMNJhcdXmsyVM6XrNA81chTuQqsRhl9Vp06JZeUtWLsFzp0fYwOdKasWs+mrcahtDBLi3imJ7v44uHocLnvZPC6NhIICH6dObY3EHi0AhYXzUXKkHPvEQL6lucrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrReSzt1viFtrrmsZHR21zzYTBDhjfiA/E7QWNDYML0=;
 b=MA6gjzc9keGC+CQZkFTD3Ds+G4T4q0LsCSXT71w8VfltAkVU/Y+DM+saIwhSDB1ETQ6ozDHqY+JhKoziRP08wC5A1FHQPYhTdmyjpgQWmiL/kerj+N1YbtR/cvWU6yWGdNgkPSAu05b6y0g6VAmXfHvBwyO9X3GG4Xxp0CEU52b412lxnddO5/wPHNhvdRyzUCQdk0ZdWsvx8Ecah4Lez2vh5WMx22hpJ+R4yANxomJyHkxT/vUXhwlWYJab/ID58bsYcgmJTZgHjflfrdhsTGfllpW3hMqysLC09kUVjyqL8WlfYn3/OCnFsMk6feOEPmIoXCXRhHklmewAO1lfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrReSzt1viFtrrmsZHR21zzYTBDhjfiA/E7QWNDYML0=;
 b=giu/EzXcUXgOTKUAkbxGRoHbGbKetEMrQvRNDZHd4EyOPxhpIaVfAyIRXDVTyf+Md0EZXllteM/AjNogcOKu2Nbp+RYn+flTKTSg1uwqUZHkK5OomSv7BN0/eF9VNvKR2p9EfDIine1b4E7DjCa197pNFGN03YtNHf/DK630DD8=
Date:   Wed, 24 Mar 2021 16:13:59 +0100
From:   Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFtXNw8ZKkp82EIH@Air-de-Roger>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com> <YFtEw7qHQKE/4p8t@Air-de-Roger>
 <YFtLNLTrR9wTO41W@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFtLNLTrR9wTO41W@smile.fi.intel.com>
X-ClientProxiedBy: MR2P264CA0174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e662c5f-0f50-42d4-021b-08d8eed77690
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-Microsoft-Antispam-PRVS: <DS7PR03MB55906D9F17705CFB2D1B96F88F639@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnnrdxuX5UCIOgYv80Hp35pCGLqC2enbOnbTOj6l66gFin8iIn4N/v/gHxWG54aBO6hkYy69wzMt4Ro72sUwyYNknu9mPX+BWd7NJksJKW8L4jOf+uJqYEBYeuoJ26y5GuUUJ1sCTccTg6/Hn6jIpnj8qWiqL1PqKoynHBylUBbv4tNCIN/YLKdhMxI/Lff2s8K3aW7ZjqO74S/teZ4ZRhx7s4cyVutYLrm4VIDVNq+6xPtyGusb9a+ntX75DsxHpitYOChpfhKPaIN9pGD761nGQtgUJRb2L35olA6uM19PRPg52YIjg3eIdTovHP3nxRZC6QqTTjArnrTAHbKXJJbKMJhamhgCmdxKS0UpmKcmUwlqwysdZ5/lCdzaKojRQkeLe/XPYlGVUcG/Z5dM9YESYQyY55KQH2kIx5ItybCm8e35m1Nxdg9ga0TRQHEoImXSPc0aOPZdGIFr5QfsSkIcK8q8s2amZkTo+cPOLHIqwdwju/f/wYxFRCc205ea01KJR0dFtP77cd58ilFMnJcTDJJhZ4dRH48M3yI3bU5fuXj7tq9z99QCDUTfMNebkbURgGVtXoBdrc5knfqt29ACCQExzJA8N2ziWIiHRs723VKRLp/VGzSzKyQUJb0eytILX7jEkO8Zs0B8lLWVo+eJkP5LIjuCiqYA4BQhqGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(376002)(366004)(346002)(396003)(8676002)(26005)(956004)(8936002)(83380400001)(85182001)(6666004)(478600001)(186003)(16526019)(6486002)(54906003)(6496006)(4326008)(66946007)(2906002)(66556008)(66476007)(33716001)(6916009)(38100700001)(9686003)(5660300002)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cC8yaGlzQkFOclhZMzY5YlhObDd5WnJoZ0s1VnZVdnVZdjJqaFhCdDNOOHFu?=
 =?utf-8?B?a3ZyWEVZV3MzbjRVSlhaUnladys1M3gvdnk1ZmZrVUdYUXZ1UWFCZ2dzL2ZT?=
 =?utf-8?B?NktROVpLdjF4cUx0b0pVYVRrWE9KMitVRStsc05Jc0dmUmpxNldLNHZIc3Fs?=
 =?utf-8?B?bjBEc1dYdDVxdWRFUXIxcXlyK0VZeXNaM2JkL3JIdDhIV0pPY3BnWlhvaVZv?=
 =?utf-8?B?MVE4K3R5bFd2anlYWmZLdzl4N3VOMGprcklMRUdVWmVkazc1RHdjaHczRTNs?=
 =?utf-8?B?T2JHdDRRREI4Ky9iR1hwS3hLMEFvVzlpcCs0QytDcWRVMFpGSEhaWkdDN1Zz?=
 =?utf-8?B?YVJOZ1FKZDQxVXdRcnRDZ2JXZGVpUzkvSSsxZDZRTlNxK29COER1bUpyNnls?=
 =?utf-8?B?ajBYcXVlQVl3MzRLdHAxM21CRnBWb0pmV2JKekpWdTlYUmZ6ZDZMOFdzQThq?=
 =?utf-8?B?U1lBRDIvNU5IMDlLUkxDdndtTmgveVhCdThNck1UL1k0SlFtMkdrb21TNS9Z?=
 =?utf-8?B?TWJFWHc4MWJoOEVnSjVxazZ4VXljNVdXdXlHRGNubENadjI4NDI0dTVraFRt?=
 =?utf-8?B?Z3EyVVo3QlF1eWFBNWJkSHRJak53OVlFV3laaVc3Mzdib3lJOWpsMnFjTDg3?=
 =?utf-8?B?QmFEUVFNS2VsYUoxZU5ybWhTdXdLMU05SDVHZzVCd3JEazVlanhTRFdUeXR2?=
 =?utf-8?B?bXJiV3ZVSDE4cjdTaHZMZnZvM2xDdnVwdnRCQzRmNTBCb21sQVJ4dUFacC85?=
 =?utf-8?B?SjFtc201VldZWitTV3dxelh6czZaRHRQd0FNa2RpclVJWS9RNXE0SXJJbzVY?=
 =?utf-8?B?RElsSG1vYjNZTjNQR0ppcUJicXRtbDgvMUx2WnJ6NzR1eDIzR1hsTVV6bkRy?=
 =?utf-8?B?dFpGVGdSOXJzQXYrb1EvcUcrRTRvM2ZzOGE5Q3ZtUGpMb2s5d2dpazNqMEd4?=
 =?utf-8?B?TmlVS04yWFNBUzFFeVB5U1hLMnh5OThYeis4WTA4VFV0Z1JLV09TTnl5ZkVW?=
 =?utf-8?B?SnVEMnFoWHVxYWttQUF4cmJoSWtzN2xZUGIvaUhycXVQQjN3cGgrb3llTzB2?=
 =?utf-8?B?WmtYRzNBenZuVzNmSTRQK3ltenVDbnNZTFY1SDVna21lL3Q2R0pocDR0V2t1?=
 =?utf-8?B?aXNubWRxYVdEZm5YUXZRY3l1aHFlNFQweDJmTHBsbFo3Ny82clhzbHNWb0VN?=
 =?utf-8?B?a2tKR0xOQkZBSU1KclYreXFVUlh0ZW5SSUxxd25FOWV3WEkxSmZ6MktzTDd1?=
 =?utf-8?B?Z25HQUs1NkpyV3FJU2psTlRtNGU5cXBHTGFucHAxdUluTXpHcWYvcVllMDRE?=
 =?utf-8?B?MmdMOUlXNEVxbXFKVHlkK2d2Ly9lRGhENWFsTWZkSkthYTVFc1BaaTFBZGJG?=
 =?utf-8?B?cWZNeXl3MGFaQXFaVkQ1T3hTS0FqSG9DbHRSL1FWQjY1RGVxbCswc0NQM2JV?=
 =?utf-8?B?NVdHNy9OSmJJM2d4RjN0MUhjMDhtVklXeE54WEQ3V0MrcjJLNXg2Y2pNRnV6?=
 =?utf-8?B?TXl1a1ZocUZaemhteVdMcnFhN1ZaSTByYU9RWHBmcHBIM1NkTEhPZzZRcWlV?=
 =?utf-8?B?QkxRb2pmbUpONkFGeTVlUjIzZWhEVzVjZGNWQ1BrdWN3eVRqTXNmejlYSzVT?=
 =?utf-8?B?eFlKaHJJV0ZKOTBlWWxaMWtRd3RzdGY0cVBWZTdob1BiMlBra1ZtTlRxY3ZB?=
 =?utf-8?B?Q2N6OXliaGZkYVpIbUZqczJQZkZqK0d1NkNiMTRGNDdFc0NXdDBlQktHQW1v?=
 =?utf-8?Q?aeONHDALkbqRBbgucE+I4ocbqhbcVFA6MCibX60?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e662c5f-0f50-42d4-021b-08d8eed77690
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 15:14:04.9514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJfOFZxQ0N+3KqUI5VQh2IA/rpmg7T8i23m0Y0j5eolRcVLBc9EVuS8ec7hjqmwaHy9HvA+7RsUwKILgCpT9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 04:22:44PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 24, 2021 at 02:55:15PM +0100, Roger Pau Monné wrote:
> > On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > > On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:
> > > Moreover, it seems you are bailing out and basically denying driver to load.
> > > This does look that capability is simply the first register that blows the setup.
> > > I think you have to fix something into Xen to avoid loading these drivers or
> > > check with something like pci_device_is_present() approach.
> > 
> > Is there a backing PCI device BAR for those MMIO regions that the
> > pinctrl driver is trying to access? AFAICT those regions are only
> > reported in the ACPI DSDT table on the _CRS method of the object (at
> > least on my system).
> 
> Unfortunately it does not expose PCI configuration space.

Are those regions supposed to be marked as reserved in the memory map,
or that's left to the discretion of the hardware vendor?

> > Doing something like pci_device_is_present would require a register
> > that we know will never return ~0 unless the device is not present. As
> > said above, maybe we could use REVID to that end?
> 
> Yes, that's good, see above.
> 
> WRT capabilities, if we crash we will see the report immediately on the
> hardware which has such an issue. (It's quite unlikely we will ever have one,
> that's why I consider it's not critical)

I would rather prefer to not crash, because I think the kernel should
only resort to crashing when there's no alternative, and here it's
perfectly fine to just print an error message and don't load the
driver. IMO I would rather boot without pinctrl than get a panic if
it turns out pinctrl capabilities list is somehow corrupted. It's a
long shot, but the check added in order to prevent this scenario is
minimal.

In any case I will send a new version with the REVID check and this
current patch.

Thanks, Roger.
