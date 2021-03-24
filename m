Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC0E3478A5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 13:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhCXMja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 08:39:30 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:52255 "EHLO
        esa6.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbhCXMjH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 08:39:07 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Mar 2021 08:39:07 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616589547;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=R4gkis194kilftpQstf9rZL9/bcNSgw//ydipzRXofk=;
  b=GWfxjQmVSTpDJWXHPCrrNAtabDf++z6szNE3x5I0ZECG6e7OazbnBCVz
   hqYIKW5l1b6VDmmryR3NOoWvUFJIZ/wxvGoIRSm7CWLqiiwRSg9r3nPiA
   E3gpBJ/u1VpjQMP+TCmSLkp25TE9nzuFKoVQ6ajYFFdPpNpYx3oXLzHYW
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YvE/SYBQjZkmiLZVR/s9RWc1wp0hPbnz1mMDbt7SupI7cYiHIMeRb1MFVLD7rBDO/rz1jL7fzR
 JFdw6HovvlLqbNLqkQQZ/oi9hvbLDEwk/BzFTN/0fJR/etdBtb3TUwfpM0j0k3OVTDOOiGFyjQ
 WTos7uIbE03rXG9TnoOeoep+aj90Wc69s0JBlPs24eUUYMzIOwfC1J8Pi2FFGiIG0v4MtItG2u
 di1ABYmmkntoPY3bCjKcXQvr1yh/Ov60NxoYkJ5ZTkE/C2FUKuhe6Yrb5JEFzc1DFO6YDIRhcH
 55g=
X-SBRS: 5.2
X-MesageID: 40164727
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Zt6Y4qHcc/kVw6ZYpLqFDJTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQacjHJ
 2H6cZd4xamc3IbbsO0b0N1JdTrjdvNiZ7gfFo6FwcqgTP+9g+AxZzbN1yj3hkYWy5S2rtKyw
 b4uiHw+6nLiYDc9jbyzGnWhq4m+ufJ7vtmKIiyhtMOKjPq4zzYGrhJf7GZpjg6rKWOxT8R4a
 DxiiwtNchy9H/dF1vdyXCGu3iCoUYTwkTv1EOChj/bqdH5LQhKdPZpv55TcRfS9iMbzbZB+Z
 9Mtljp0qZ/PFfrmSTw4MXwTBd6lka4impKq59us1VvFaQZc7NftooZ4Qd8F4oBBjvz7MQdHP
 BpF9y03ocdTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlxxbhmpwwUc0zNEW901wua4Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWoKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGDfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y859oFBMn2XO
 uyJYJ2D/fvIXCGI/cI4yTOH71pbVUOWswcvdg2H3iUpNjQF4HsvuvHNNbfTYCdUgoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwja9ZJ0G67KwvgLxOE2R89xmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz2mrU8WNzOF54AlxO6LvtF1NGzDV6f3/cQPImgZGyaGpS1HyIKltUVMXNCj
 NSoFxx5OaQNJyfxScrDvq9KWKEh34vpHaHJq1s25Gr1IPAQNcVH5wmUKt+GUHgDBpugztnr2
 9FdUs5XEPFLyjvjq+klZQQI+nae7BH8UKWCP8RjUiamVSXpMkpSHdeezK1S8aYjTwjQCduik
 Rr/7USh6eBnjiTOXIy6d5IQWFkWSCyOvZrHQ6FbIJblvTQdAZ8QXyjqBaahxswE1Cavnk6ty
 jEF2m5aPvLCl1StjRkya7s6kpzbXjYVVl3cGpGvYp0Ennmtn5/3fSQXLe613KcZzI5s6UgGQ
 CARQFXDhJlxtix2hLQpS2LEm8+wI4yesPaF7YuftjoqweQAbzNsZtDOfBa/Jxobo+z9sAKVP
 +SYA+TInfTDfgz1wmcu3YiP21VpRAf4IHV8SygyFL9+ng1Rcf2ChBBYZowJtmH9WjqR/qSyv
 xC/KQIlNr1Fl+0U8KMzKHcUiVKJRzSq1OnVu1Ak+EmgYsC8J9IW6TBWTTG1Ht7zAwzAcf9mk
 QZWrl66tn6S/pSVv1XXypY+1Yz/e7/VHcDg0jTAuUke0sqgGKeF9SV46DQob5HODzImCLAfX
 2e+TZa5fHLQm+q0qMbEbs5JSBzZFIn4HpvuMOEeIu4MnTgS8hzuH67OGS6arlTVeysHqgRtA
 9z55WwpNCsHhCIrzz4jH9cOaJB82GuXMO0DkatIIdzgqGHEGXJpLCr7s61hCrwUh2hZS0j9M
 p4SXA=
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40164727"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgDQOaSsfd3W3qD9htEZcTaPiyPjAN+aVMqunwhtdUzIXAEc1c/F6YeLFjFWYKeFmIMr4erpDIdP/+Z4TDsvaCl1xErXkNshG9re4q6XaJdXwNWMMcI4d4oLGx9QDQRyhnEHyUqOjsTZ/1OERgr6SGEMmgmJMY++ZegwH6z3TLKFMs6G1aPCReLlnxclIKX8RcWK/wts9GSC+HHwD+F0IxpKCxgdTwZ9gurO40Kg+qbjsCW8nPgmQgQZyjI8dYyj8nB51DSLPc7RRZu+6u+3LT8yhsvfrwL7B4mp7W2Ke/vxVHWb9ABCcRbR9uY5hMlL3nWmgr5fu4B6dpjFqhaPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POqR+yGlRcp/InBe4dSo99f2+VyBz/rcTmCM4AxG96w=;
 b=GIiI9WOcFt6E9RLyXnT1fglJ3B9WzlQZUDnrxcu5XITGaMjn1fDEMUjD5ykidavFk7tpb/R9bMIJscUQ4nDpjrYWmHAbOTJ/4Rdjuri47ROG3Hb2JLB7+WhvO0R6NgyAYSh+sHkusdW97V6m3p0FBRjZGJc6tYHGK7MeMJ7YdUS35gVQ71cm/vzcLrQZQztzFRFOufQv4TMTWQabPXXMCPiYyajMkuBjVwEy8VObl55annQlGQEIruqxe1Ok2r/17M2csSxoRHrX6RpKnhyHDrTAgTP7NWXI7fGbDrJBVm9uT9YgoXFxoahYXfsYiTZqybWkEGblzBKeibtSUXq74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POqR+yGlRcp/InBe4dSo99f2+VyBz/rcTmCM4AxG96w=;
 b=mQJ+v9ZlRgcbMPOXMfz9prtuKnnR0rHEneCml8nBCrCe4O+mfRJgRqGwEYKSMUr/5Q1GM8tz1rQATuFiU58hMVhsIb0y3mjU8U131e0PFK95F4/TBT2Niw+EWAX5Ot4hv4BIGUAtn9HqwV86nae1cChJgAr3hSjQDHMfiuZpjzw=
From:   Roger Pau Monne <roger.pau@citrix.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <xen-devel@lists.xenproject.org>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH RESEND] intel/pinctrl: check capability offset is between MMIO region
Date:   Wed, 24 Mar 2021 13:31:18 +0100
Message-ID: <20210324123118.58865-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d6d2bac-85c1-4936-e2b7-08d8eec0d031
X-MS-TrafficTypeDiagnostic: DM6PR03MB4539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB45395BED1AA69CBB56F227FB8F639@DM6PR03MB4539.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+BTsEOI/Yk7IN6cquruSnNPhksZGXV17HknzSm0EO7b+bvjjc42Q4n/SWTwe+yl1kbI3uze+tywyOREB+ODqGAW+MGtsagVUYvpVsD/GvGwfik7lnM08fMfwLVFcZ2W+LapHqErIDfFXhekQ4bUUJ0gv4gx6N2/y4ZFcAa3OOG72UYc+xcsQvPIz0FXXqFWNJdKrSoOhrnaYxt0plFn7XN8RWdWV+XUB8prACktKIwFSdUT0eTgmm7kzvyl0ZrsgxFSEIpTnV4ZKZPzls6o4Y73pigfzEtLQj+J/sT/X1bTJWlyTjA7axSAq6hqGRw6HUF3U/zApU5MP5vpIQZbtNbkyCTo7Gs0ffTU8VnhXHFHBNxzO7A4n0EFs0YkTD9Zf+AXZgCxOVURGLvDuKp/jwRJRbChRljhtbmzQ+Aa9HIXlrLnzWE5Vvya1zGqaRXYcLOMiUYodNG0Cl+xj1Lz6hjkotZmi0M5IOmPIR5Hr1PsIdIPXYNWpxoNs3a6Cr2gO3idHkwguIV6/ol0A6wV7KV+8u8mEEm/k6Tj5hGawfixnk0vpBC+TKaetiNJcEKYrjwsUtWO9+TG1EODlSYOfFUfTnEyrZWT8qAZqEOj4tKq47NenWHJl+asi8doezpSNDFOItGiClYPkZyYHGI44bTZBP5b1snHxBZY/5qlme4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(83380400001)(6666004)(2906002)(186003)(86362001)(4326008)(5660300002)(26005)(54906003)(36756003)(38100700001)(1076003)(316002)(16526019)(8676002)(2616005)(6486002)(66476007)(6916009)(66946007)(956004)(8936002)(66556008)(478600001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MFhWZFZIUXduOVVYTlZVcjZjcFl3cWxLSWdBQVFHcUtsTWE0bzlVbDVBVmd2?=
 =?utf-8?B?MUJGclZISkI4eHpKOGsvTG9lNXhCRU0xb3hTR2VJaHlNMjUwN2tzcUxTS1l1?=
 =?utf-8?B?VGlXMDMzUTU4d0VvZWhOSm1SdlkvRlBlQ0VibEpiaHJPUmdCdGlTZ3oxT0l0?=
 =?utf-8?B?Vi83KzV4QlkvaFpjRjFiWmMxTU54ajVmd0IyZUR0M01xTkh4VHJYeDVKcW9V?=
 =?utf-8?B?U25DcUJRWGIrRzVsMHM3bjlFeEhoUExIUzhBWHJJKzNNc1V1aFFtaHdJSDJI?=
 =?utf-8?B?aWxPSzQ1bGJncFExa3FRdk9tTXZQb3RuWFhQWWlsN1JGUXo2eVVJSkI3SWlx?=
 =?utf-8?B?bnpvU1VIbjRTWkhxZXdYRHd4OWhrSE5FQ3Bid3JIem5lenp3ZXpLVDhjU2Nx?=
 =?utf-8?B?S0JrRWdCNEdNWXB0b2dBWWc3U0FoYnZPaG9ZQUVJYWlnQVU2UDk1cWdtcmx0?=
 =?utf-8?B?YytDOVdVQ1ZYdjlVL0dCNkkyTmo0Ry81NXJHQXVxYyt0aC9xcmxhUEJYVzM5?=
 =?utf-8?B?Z1NISnRkWlNwNTlaS0NsU1UvRjNVMEZZa21HemwveVpoSzZYSC9PUjNCSnJ0?=
 =?utf-8?B?Sm04ZUZka0FGUUg2ZWpRanZkSjJ5YllKR2NHNDN0YVVuZDlTaERTOGFIdVox?=
 =?utf-8?B?R0pmMGlxTU5QVjB4MVQ2eVAwbDRJNkc5K2FvZllTbVdRSnVFeStFYTc5NVZC?=
 =?utf-8?B?U1gwSE5RMDAvQS9uY3NpLy9PU1ArekdmeGRRT0hVOU5vRGRQeTNQYytCMnlo?=
 =?utf-8?B?ejlzaWIvUExobzhoSXMrbDlHdzVIYXo5R0dEdDZaa2dKdjJWK2xTeEYzaWxk?=
 =?utf-8?B?WlJrYjNneVZUem1wcVZ2Qm9SaTJ4OTFNZEZXV3JpOFpINnpaTUNZaXM2NFNK?=
 =?utf-8?B?Zm05Wit6cWx0ZUxZeUdwNkJPOENBWUNMMFZVOWl0ekNiRjgzUHcvbzdoRS9Z?=
 =?utf-8?B?c2JOalZrOXFCVmQ4SWFSM2FmeU1TZ2taWFlzZnIvTG1ySExWMGxuVDkySHV5?=
 =?utf-8?B?RmN3bHB3Y1FWU0EydU1oOHRBOHlPenNidThkcUVkdUlwT0ZFWWwzV3poNlFr?=
 =?utf-8?B?N3hMYkRWM3B2OEEzbGRVZWpoY3VPRUFrYUpuUDB1MXZQYTRyQ0xDbHFsQmI1?=
 =?utf-8?B?SHRPVmIvSGtNWlJ3NDNvZGYyYzRCZUsvRGVlM1gyaHFCZlpCUVl4bit3bmpV?=
 =?utf-8?B?YXV0Z1Y1ZFpudWF4dUNwRHdCU0F3S2F1UmhKZlQwbDdJL2xaWjMybEpraDFz?=
 =?utf-8?B?Q3FpV3RwOGlidnRqRG9ITnFzNWVOWnFicmRUalRJQm1FRHJOWHpSbmFILzBU?=
 =?utf-8?B?NUFsdUE1akJVSE5zbk54T3BnSTB3UXB1RzJsY0xja0hUYXk5RkNvRGNnSHU3?=
 =?utf-8?B?N2Nkc3g5NTUrK3FUUHcrMytvbzRhZ0ZiT0lhSE1ia0hwVEkxTlpSOUtFdkZE?=
 =?utf-8?B?Wk1oUTBhTEUxQ0NJU1JRTjhWdFM2TS9zcXVyeUlUMjhwS091eVAzKzFUeVR2?=
 =?utf-8?B?dUM0WWdmbGtkenN0LzFLRjhCUzhKT1NVSTJ2Y1BXNkRLNTVycTJjMmJ5Y21y?=
 =?utf-8?B?Wm5FNk1wTEFwWHVJeDM1UHVYeTVtZjlHWUJmWUFqNkt3d3luS2dKQ2t6Qmlh?=
 =?utf-8?B?RmR5N1UrUE9HMzFxVW51WkUvZWNZRFg5UnVkd0EzbEZIZDlmNXJkSXQxZ3Bp?=
 =?utf-8?B?cEFCeFpnbGE2ekY2MlBGODJvaGNTcGxETURlQmpHVzBSWjBXNmJncTNpajBH?=
 =?utf-8?Q?dwWuqF53Nx1KqR31R509HT/VO6cxnUhWg64C58X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6d2bac-85c1-4936-e2b7-08d8eec0d031
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:31:56.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9oFOlKY/6NeDTSIPMKZLXlX8D16tgYJIzZHHVecf9LrQBWW8SNfRGewzeZ3cvbb41RFCMB1t7YbRcy7UCZj+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4539
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When parsing the capability list make sure the offset is between the
MMIO region mapped in 'regs', or else the kernel hits a page fault.

This fault has been seen when running as a Xen PVH dom0, which doesn't
have the MMIO regions mapped into the domain physical memory map,
despite having the device reported in the ACPI DSDT table. This
results in reporting a capability offset of 0xffff (because the kernel
is accessing unpopulated memory), and such offset is outside of the
mapped region.

Adding the check is harmless, and prevents buggy or broken systems
from crashing the kernel if the MMIO region is not properly reported.

Fixes: 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
Resend because I've missed adding the maintainers, sorry for the spam.
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8085782cd8f9..bc8b990d8021 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1481,16 +1481,22 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
+		struct resource *res;
 		void __iomem *regs;
+		size_t size;
 		u32 offset;
 		u32 value;
 
 		*community = pctrl->soc->communities[i];
 
-		regs = devm_platform_ioremap_resource(pdev, community->barno);
+		regs = devm_platform_get_and_ioremap_resource(pdev,
+							      community->barno,
+							      &res);
 		if (IS_ERR(regs))
 			return PTR_ERR(regs);
 
+		size = res->end - res->start;
+
 		/* Determine community features based on the revision */
 		value = readl(regs + REVID);
 		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
@@ -1519,6 +1525,12 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 				break;
 			}
 			offset = (value & CAPLIST_NEXT_MASK) >> CAPLIST_NEXT_SHIFT;
+			if (offset >= size) {
+				dev_err(&pdev->dev,
+					"wrong capability offset: %#x\n",
+					offset);
+				return -ENOENT;
+			}
 		} while (offset);
 
 		dev_dbg(&pdev->dev, "Community%d features: %#08x\n", i, community->features);
-- 
2.30.1

