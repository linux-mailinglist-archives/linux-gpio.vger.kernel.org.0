Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B7A347CE3
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 16:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236717AbhCXPn6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 11:43:58 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:44605 "EHLO
        esa2.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236730AbhCXPnj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 11:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616600618;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=4t8h/V5VL/2YLVJYxqD1SyLsO/NLKW39GY5oNhNfJew=;
  b=ZMhTjuY2nJnID8vUW9OUkGxCzzEHBqdZjdVRyCPEeRQHWxTK5umtb8yj
   260JlibIMMNNJ99G4wTgFamXkQbEy5UA4PCUn0vU8oGcoiTWpD3ZXWVRV
   FNPU9vM72xlf+5XSRxleAkg6tRqhEHNVdPnpQ9c27kE/UpMpxnARIF5jS
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jTeEk/lbNR9qEfHw84rDBy5E3ddNzhCj1EvIfD12oB1OwAfQcGHQTqXoihpnNsjmbqyjdwFAqR
 w6O46a73e1o3HcN3OfDkgFlx+lhpIClKOdtNhTH7I4qN96lLSZxObqMLkgIF2DuUFGrffy/xdQ
 bDqKK1L/MWnFCNc5OkL9QW13euWjODcBknRONke5575Pe6o1lpn1BX9mi96QBHPYzeriqS+Zzs
 vqbNw0IqJ5NxOqaSS+hS91S12AoC+qqL9D5zb6udkST3rDssTRFGNWMO7V1mgtjQuOrbbmzb/Q
 sYI=
X-SBRS: 5.2
X-MesageID: 40038641
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:O+q+y6gZKQOfU4iYmmZMhp/t1XBQX31w3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+QsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmv5
 tIW5NVTOf9BV0St63HySGzGdo43Z2j+Kenme/Rwx5WPHlXQotn6Bp0DRveN0VwShVPC5ZRLu
 vm2uNsoT28dXMLKvmqH3VtZZmPm/TntrLDJSQHCRku9RWUgVqThILSPhCE0n4lIldy6Jg492
 ytqW3Ez4Wl98q20xrNk1LUhq4m4efJ7vtmKIiyhtMOKjPq4zzYKLhJf7GZpjg6rKWOxT8R4b
 7xiiwtNchy9H/dF1vdyXSC5yDa3Dkj8HPkw1OD6EGTx/DRfi4wCMZKmOtiA3jkwncgp9113e
 Zq2G+UpvNsfHb9tRn9/NTBWlVWkFO1qxMZ4IwupkFYOLF/VJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHwpABUsZKRd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSqND+/
 /PPs1T5fBzZ/5TSZg4KPYKQMOxBGCIawnLKniuLVPuE7xCHH7RtZjt4vEQ6PuxcJIFiLs+8a
 6xEG9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+tx3obv5SL33MTCSSVwnnse6ys9vQPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYkUt78AKhezi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2IM1B60usS2LpmRS5YQKoRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbTtYsqI3e0
 N6KKj9kryyoHS3+Wqg1RQrBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmGecKgRnVMPQGg
 5Hr1Fx8aa6RqbgghwKOpaCCCa3nnETrHWFQ9MggaWF/97iYY59JI0hQrZNGQLCEAFVlQ5mpH
 xYUhINQlbSG1rV+OOYpa1RINuaVtFnxC+3PMZfqBvkxD+hjPBqYkFeYhmDfoq8hx00Sz9dm1
 trmpVv/YaoqHKIMmswgOMxLVtWTn+YaYg2QzitbJlIm7ztZQF7RXqLgzvfkB0oZm/27Swp9x
 DcBDzRdvfRDlVHvHdElq7s7VNvb22YO1l9c3ZgrORGZC/7k2c21e+Afayo1WSNLlME3+EGKT
 nACAFiaz9G1pSy1BSPniyFGmhjzpIyPvbFBLBmd73IwHuiJMmJkq4BdsUktKpNJZTrsuURV/
 iYdBLQJDTkC/kx0wjQv207IkBP2QwZuOKt3Aeg4Hmz3XY5D/aXKFN6R6sDK9XZ62T/Xf6H3J
 hwkNpdh5r7DkzhLtqdja3HZT9KLR3e5XS7SOwlsphYt6M/vrkbJeisbRLYkHVcmBkuJsb9k0
 0TBLlh6LfaI4l1YogcfTla8ldBrqX8EGI79gjtRukwclEmgyWFY5eH47/UpaEuBUPErg3qIl
 Wb+zBc+fCAXybr789rN4sgZWBNLE4y53Rp8LncK8neCAC2e/pC+1T/M2LVSs4tdIGVXbEL6h
 B96JWUmuXScSzy0gXZpyF6LaJD6HzPe7LEPCucXepTt8WnMlGNiLaw6MG9jD3rWSK2An5o+7
 FtZAgVdIBfkTEsg408zziqRqH2qkwjlUFC4TsPrC+f5qG2pGHBHU9HNgXFgpJZGTlLW0L48v
 jt4KyG3HH87TBZ1d3JFkhLF+s+b+Qtcg==
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40038641"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnZtZ31uyTy8GgIBhWrpw+0uZhdA18obqrEszjxVp9xMACjwuwu4I0Qq0XiwCnNgi7x41JxF3ScEvCJrjQjkpb8Tmq2NphUaaoy8E6osLM6WiqxFbe79DY3KL4RMUPJVtbf7pF1Vt6UcUh6WG8w+/OL+xs5hQHCboSt5ci52LvdQk8I2uMyK6fW2iEbRdR0jH0es0p0lg/WkpecoPY4jZOnqlR0JSf0s5y2e7J9NFv55+3i1E5caN22bSyqtNlLJYDEmKaKpL4/YKGYI5G5jubDWpA7DRVyjMOVsJjrcWPyKZXq8tgyWkpY9beFf1VFb6+OTglSSKd7U3dBGRla+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rli26qDOxYcb4kpE5ga12+P45RCsjyWASRzYmRxUWtc=;
 b=LYWlBPaUBt75BNtkqYaCpviAOCvjE+zNge2Ei6HML0RGjnOxCe78uMeDCxLDSOhV1HAJGFsbBsvz+OL5DCerZIXf4/LrNIBu3B2yscs/N3lb1sxHkLornFsrNj23chSdOkHLvKDJu008JzbWc2WXd4upxWBeC1d79sF1dtdyHTCDnNLivFx0QLt78yU/ddI0r3qqrnOLe2He7lsFY7ss50yM822l2+1copqN7FZkcwulr0bkOg9bgXTlsr4jgCmxni7AX7qXaQbUQQaLTC1t6aPpzMOqI3QdCfkUSRk+ApSDoKVzqdQU3ZKLz+yV2qO7+b88FgVL5t+AhPfnAIk1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rli26qDOxYcb4kpE5ga12+P45RCsjyWASRzYmRxUWtc=;
 b=U6Ln8Jl4RB7FCTcYj5OT537APEnBExNj9J5Lzc6ByRgr8JH7bIQqNmbyPM10EKHe0vPYfu5Gvp0rOHqeATdfmBzJguLAjf8zc3HTZokglO2F1Yc4m4Yy0HaYe8WsS+y3yCLEwgyXAp5/OwO4dHHdtL8CM0YDCjnPCocxHoErNKg=
From:   Roger Pau Monne <roger.pau@citrix.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <xen-devel@lists.xenproject.org>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 0/2] intel/pinctrl: check some registers reads
Date:   Wed, 24 Mar 2021 16:43:10 +0100
Message-ID: <20210324154312.61878-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::36)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75109aae-d4fa-42cc-ca9b-08d8eedb957f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4763:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB47634E087B53E5572CF731198F639@DM6PR03MB4763.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FqjHesKsUuAe5wbEP/a8iH7UTAwoNpecjDpDA8MB1IDwSE1TgFQsv5Y/DIfrYlH1WUipOQ1i2y82ALcqmOEXJ6OggCzSA7EnQOPeME/iabM/PaVVcAFiNjp83QWKNlHgJp6lug4dlRGKP6YTKbZHvtbiTCAV4wGISP4yRr4JRbsyD/JP1JUnTHrSqOTWmOsh3kiWfJ3wF4ZU7FFJSsCE3O3HtfTnBD27IPeo//fZQlSM3csf3NordgewwDJtHHYT+pXaXp9t4wdXWf/wspQqNcpEByZyjjJwFcGppRkzdFxzGx0UE8nYjcgdQE0NKcQSJbWue9G6VX173JERstZ+FFVwjJEEwow4bJBQF+ijb8NcF1soXlNKCEk/pWN3Kh7nlbq0WiGQPZdIKIuJk00Z+1RpI8Ws5OHYEOLb77iB5pb6m8MY2vu/fA8NCH2kDTybj0fTA+jtZGpcGDOp3+bL/TFKIAXef3JmJjvOKciu/xGm8nqA1SGzRchy9/qZpehZrVRMHw4uUyZltx9MZfMTSsIilIWAgOAy0swEX7JaTX4NPf1ILiUX5JbrpdwPxNBjys7M66uhy+tydUiOAC4h/fELbDIEZSu/4CNgE9uR0eWgYm+SYd1gABGUFqbb/Cw53NUMBDjWsVHex3nZXV+rZc3vam5VSjlNzTgoaapDJtI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(956004)(478600001)(8676002)(186003)(6666004)(4326008)(86362001)(36756003)(16526019)(54906003)(26005)(4744005)(8936002)(38100700001)(6486002)(316002)(6496006)(2906002)(6916009)(66556008)(66476007)(83380400001)(66946007)(1076003)(2616005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFNzNWxGaWRZT2VKMkIvRHZiVU85ay91L000ckZWdS9aTkcvcmVWRUFWQnhr?=
 =?utf-8?B?RzE0VjZlLzVObG5laDB0eGNaa1ZkTHZaa1d3U2pNaUEvUm5PczRlTUljU1hD?=
 =?utf-8?B?bmh5NXJYOUxZbmtTeXN0c3Y2VjlWRy9Nd1ZOaWl2c3c1WlQ1VG90VGlCTExI?=
 =?utf-8?B?Z29BVXZYTC9ha01zK1dGckp5NVdPa1pvWFpyUVgrRUNQcTdNQ0lpOXkvRkVF?=
 =?utf-8?B?bWY3MXRncVo0dkpIY0VnOFg0TmhyV1NGemJ2VVVWOFFZQ1crWTdPTjFpNGpi?=
 =?utf-8?B?WmtEb0hneDZXaXYxblNieGxnUGt5V0dMRGVBNWU5dFNQT293U3FtUllYQjh5?=
 =?utf-8?B?VEhnQ3lDKzhsQVk2Ly9TeUtRNnJLSzZFeENxL3pnajdCNXBNakkveDZ6czBq?=
 =?utf-8?B?SURuaHBvSmxaQVBPL2pvdmJaajJNUWs4TTFiMXUyRm54aTJoQjJtQ3pldzlH?=
 =?utf-8?B?RndsazhTempLK0dhTjllRlFJUlRIcW9vM0tRSy9ET1ZnREMvbnZNaXBzWGxV?=
 =?utf-8?B?RTJabGhSdUdKOE0rY2UzMWdIa0hHUU43OE9hTHYyTzlJUFNCbVMwYk8rR2pJ?=
 =?utf-8?B?UmpBK1FXSHRnUmQxeStHZHBzRHRXc0pZdFFTeVNSUDhEYjhWWkk1QlpOU0J0?=
 =?utf-8?B?cnRySVBoLytxY2JCNXREM1hGMGdBYXM2ZkVFSzE0UkMvRUkrc0pkME93dDhk?=
 =?utf-8?B?WUkzdzYxWUV3aGlwQ1krRm5TRmwrK2x0aG5jZzRxZkZsSVBQdmpIeFhoMzVO?=
 =?utf-8?B?U3lJNnVHbExlaENvemRFSDJWdDdRVjZJYVE4SjVaM1hqV3hSN2pQYVpKSXRu?=
 =?utf-8?B?SGJpZmsvUjdaRU43eWdFYnI4eTQxaDIybCtldXJyK3Z2bmZvUVJ2YlZNMFhG?=
 =?utf-8?B?RERoeWkrTjBxWE4zY3N0VEdwY2p2SEJLNEJrTDYvSmJLWVhRb1JKWVVsRTNL?=
 =?utf-8?B?c1RpL2xEMFkvTVFZckJlWVE1Q1h4d00zT3ltc1NtTGhaOXlnL3llWVlxZ1VF?=
 =?utf-8?B?QTY1YUpRSjhGRkswaHF2ZE1qQW9ZdGRoZnBIZERubDBQRTdRc3kwVHNhczYw?=
 =?utf-8?B?OHRaMis3RjRDOW1VdDRpZGlhRjE2OW5sdTM1emU4YytaZlR4UEJiVVlybHhV?=
 =?utf-8?B?STFOb1IweFNTYUk3d0JhN1hnbFdLSzVxOXg3alVQeEhNNzY2VXJraUI0M2FT?=
 =?utf-8?B?dGo4YVFMLzZVSnNaeVU0Vy9GdC9KQlcrZHJ4dGh4VXNJYnFUbE1oT2F2MGRq?=
 =?utf-8?B?SUxRektSTFNVSHhCd1Z4UHkyRm8wdEU1Z3pYbzVOVGNNb2d0TGVxZEp3R0o5?=
 =?utf-8?B?VEdpRHRYUFJnSHhFVGdqWVFoR0N2TStFbEJWa01nZ25HOGZ4ZldKcy9ZcjNL?=
 =?utf-8?B?dEEzSy8xUGNDWFZHZHF6M1l0Ungrc1FlOFIwWXU5Q204YXgwTWhMWndtSFNS?=
 =?utf-8?B?NzlOWVIzcFEvdCtzMWlUSG4yWGN1eFZBd1p3ZTJIdVJYRGowSDd6THdDcHZX?=
 =?utf-8?B?SGJra2pwd1Y1eUxFL09wcEkrWXpFWnlzRVVyallmNnJCNzZCMGJBWXBuNjlY?=
 =?utf-8?B?QUw2MCt6VzJEbllMbGtsMnhxL0VEa1JoZjZIZDNaYU1MK0pSS0xOTDRPVXRY?=
 =?utf-8?B?N25DQW5hWDJIVktMWjB2dkdycENNTU41YlB3bUw2VzArY2VSdkVIeURDUHJu?=
 =?utf-8?B?S2JVZTdaRVFXR0p4Qit2YTdnMnIxcE1DdEdnYkRHajQ1T1BtSFdJS3pzZFNJ?=
 =?utf-8?Q?xWs71vojz9tCfzu4FVErbJuUPKdDQJHw3SwvLuc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75109aae-d4fa-42cc-ca9b-08d8eedb957f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 15:43:34.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyRlHSEHw19c3Odstel2gRWs3PBsvC/DiZyOJPcBHvavDQzq0QaxYIknhXk4Iu+UdnNTodjuNRS4tGh4clk0Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4763
X-OriginatorOrg: citrix.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

The following series adds some consistency checks to the values returned
by some of the MMIO registers of the Intel pinctrl device.

That done to avoid a crash when running as a PVH dom0. See patch #1 for
more details.

Thanks, Roger.

Roger Pau Monne (2):
  intel/pinctrl: check REVID register value for device presence
  intel/pinctrl: check capability offset is between MMIO region

 drivers/pinctrl/intel/pinctrl-intel.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.30.1

