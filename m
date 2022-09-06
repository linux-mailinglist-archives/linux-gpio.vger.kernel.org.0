Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 053D45AF5E2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 22:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiIFUaX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 6 Sep 2022 16:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiIFUaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 16:30:23 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FCE8034C
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 13:30:21 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2047.outbound.protection.outlook.com [104.47.22.47]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-c0QGEXjpMuuLsoIznU4d4A-2; Tue, 06 Sep 2022 22:30:18 +0200
X-MC-Unique: c0QGEXjpMuuLsoIznU4d4A-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB0067.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:1c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Tue, 6 Sep 2022 20:30:16 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b%2]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 20:30:16 +0000
Date:   Tue, 6 Sep 2022 22:30:15 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        kernel test robot <lkp@intel.com>,
        Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] kismet: WARNING: unmet direct
 dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
Message-ID: <20220906203015.GA23942@francesco-nb.int.toradex.com>
References: <202209050952.vfkohsRg-lkp@intel.com>
 <CACRpkdaLQ68VfYCfv40hGuGnpaMKchiTOSTJy9rnDKnBOQnFDw@mail.gmail.com>
 <20220905212156.GB6180@francesco-nb.int.toradex.com>
 <CACRpkdZDYVu5x=fv5ZvtH3S1OxMDqVP1yBB61WtFkV2LwdrJEA@mail.gmail.com>
In-Reply-To: <CACRpkdZDYVu5x=fv5ZvtH3S1OxMDqVP1yBB61WtFkV2LwdrJEA@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::20) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 194ae6cd-5c35-4beb-b300-08da90469bfe
X-MS-TrafficTypeDiagnostic: GV0P278MB0067:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: f/rsY49pVuoR4wJR2bqNjGkGUe6wa5Elgd57KtVLMXU4OHyE+LJQL8pWYmrjKs2GwjazyRJJlVUIGxJilGU+h+Y9sd20OLNTUOUFGsNLaa1740OZvx62ErTosIUQkGI083qdrkz7nKo4yrE5hYTvI2Mea0h4jvzKCNJeMV+YnAz2u/Y/kUoMFDPSFykjaBcjdF6Uodclt/lWSRpWt4D6bVVfq/hVPg1NYgZkpRx0AUqyPLSQTLax023mitzq4ZUmdwjzQ/oiMFuApC0iHCdxmOfi/53Mx0143ZrGKK61qUCMYcPBrs+t38HxdaFdH6/f3PVHxYA7/71FzZp51PrHW0/bC22bXcX5XXuiIOTMkMQYcH54VFnkeF+FiTALSpEc8AVoRy2mrDln+NmGaJq1k37M6bGxDvnOIaVq8Nb6rbD8InKkrr1CuVMvXsNkniruu0BeguQNAWd+uqYj/IchulP1o9G8oUJ6DnBjL+vkbth2+xuHgUO1edIIyDIZaDaJZCsGpnNMT+2Uwbf+WoIO/+KFVIcmr3EmQ1SVTusZsZrqG8L8ay8Bz2Thx25jhYdlK4p8xtjZeEK2qnbFoEoE6KvoP8EAF0+kb1Ppqom4tJW1+wFIC8c3Z7VcTBY/GGEulQMelD/Ia5CrhP5MVohfQVTj6pTV3rHjqEHl3k1hQxef12D+2mAvrycvNyfmeA4cozvxcjT5ImoPDRq/leGh1mdsne5WPz2FU+KWSKdVfqmxamJ4snB7IhsjPsiA+QxgHWC5eaEMWa7jFQJitWzQKpAvNEUif2XiY2+++9vscDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(346002)(39850400004)(396003)(38350700002)(38100700002)(1076003)(186003)(6512007)(26005)(6486002)(966005)(33656002)(44832011)(8936002)(2906002)(478600001)(5660300002)(86362001)(6916009)(54906003)(66476007)(66556008)(66946007)(4326008)(8676002)(41300700001)(316002)(6506007)(53546011)(52116002)(83380400001);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2LZIhfu5/guFwUsK3x4qn0/ejsHhCBb5rsYHtVhDPLscgnGRgTgK/9jRqdzI?=
 =?us-ascii?Q?iuEgJrgd6dSoBPkwdgOLt/sOEAN+ZqAOA9ujJEGA/a2WsE/+7gfV/T3WTt0U?=
 =?us-ascii?Q?a6Wc8ZHWjcDmoAFj2NpDDvbBioJvD7LAjn+4/AkGjw92/xBVdJeQ0c5c3lrQ?=
 =?us-ascii?Q?URDppjLYScT+0+AUTbyNbZephkflqi8H9zn8yPL0iSOwgPxSvW7lntHC0Bxj?=
 =?us-ascii?Q?yc+25XC6kO3eD/iWibsqpwpHGlDHA3oTuBxmsrFM3AHJrWpLbulGA09SjIh7?=
 =?us-ascii?Q?UEGGScVVEYJY1thfoQ1ViEqp49SJJORLbzarKU7/utN2Rer6/L32v8Nfe9bD?=
 =?us-ascii?Q?nXFJxdKvc4w6A2PFw2BnpfEmPUYnLXJhzTuQVu5cE2SSAFcp1r8kprBgb+qh?=
 =?us-ascii?Q?kvRrwrNiuVT0D8s8Oah9k7whHHue+lTMa2yD5qqZ5JWZRN8S1kTJwyOUUgcb?=
 =?us-ascii?Q?Kx0aHUQaDuFsvAcPgcp/LyjU6CNkV6XjD6DDBpKakNqjCKKfMrulXv2vjcdZ?=
 =?us-ascii?Q?4XNtXHY8bLV9sBI5GZ+NOXvCjM8kEXFiQ2t7qeljIpKuOXChBiLgRjOzMgXA?=
 =?us-ascii?Q?+4nwKkAHmoVj7s9IORc8nzlFiYqrGfyVQMDlXafBQJ44zrRFkSE36NcEHj7h?=
 =?us-ascii?Q?Bb3C0TmIIwbNl2wR9QWZHNbHYrbG2di6IlB8vLUv0B7BaElxE5Ugq1ytXVLS?=
 =?us-ascii?Q?+7dNnbifwRTX196HzcMc7a81CQ+LuAtOew6eqrBH02kXoBlGPK0z8HfF+tIi?=
 =?us-ascii?Q?yDkoHHw6y2zDrTdKKHuSFSZkoaNe4DRzXdbaW2mJGQesrhLKOBxIhHbHPo5I?=
 =?us-ascii?Q?iifrNUuUlxdG4ZXbZMhHTVHKhCUBhGSz85CJ+5cqZ6OEzupHkSmYHWcu+AiI?=
 =?us-ascii?Q?6W/HN12TyonullS/6VuRZ/2ER1xdMhKxSNEJsnwsUXLKb53em/LiGDD1Fa5c?=
 =?us-ascii?Q?ioxUpFfoiGG4SCzHBzdhfi264v8ebsahX74js7UaKxceenJe+9DFT8a2Ztfj?=
 =?us-ascii?Q?/ZruDT7rgrInWSwLyfJegf2pw59TUhqN98/BZt7oBy3iByAzwAjbHTwoPNmU?=
 =?us-ascii?Q?pGAZ2Db/7q56tl/Q/YTMTpgq2yP1gqOSfBIvapZV7dvOU/z0XrW71oP9VlzY?=
 =?us-ascii?Q?dWUx+zG2MqkhX3S9AT3OSmoXcdeobhaOUgYhdVXrvgvYBkrcGRJgn/M3ZHhR?=
 =?us-ascii?Q?4zt5ffNLmS+qnimnOIirfQXDQVJ6g+7kDQBC7PGiP5intWLQoMA9k7aB7dzr?=
 =?us-ascii?Q?ag5xPC2AOONgZzepmvYG3Up5jA6/tZsOBST7+av1iRBC2Co0uN0E9GO9sC3a?=
 =?us-ascii?Q?bEpAIc1fBv0xRftP8cFeNUFcBC99wVWdMqyZZEAk9Du/Z+TCcOuiBj6fON/d?=
 =?us-ascii?Q?zSRc95A8rg8si8AJA0tQDWubAKmKx+EpXcrfkpWNDitLkGNsxt8gTbpWXIKT?=
 =?us-ascii?Q?RodyrQ833m+FCBLwzEvg5U6zSg818LVsgTKEsc0i2G807nRuz+C+G5WUX5gy?=
 =?us-ascii?Q?Ui3ULVEu0o9yBarO0+5UoxOtfrYEeGB5C/bmu7Lrc1K2m9Z0SS3M2JGnxUQn?=
 =?us-ascii?Q?vi3azjbIBDRmAB2dWwGWEpgjD+L+KKyt7kKR8EzcuobeCaN3C0zQsS3H0DNQ?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194ae6cd-5c35-4beb-b300-08da90469bfe
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 20:30:16.6710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8Zx3h+Kcx5FPzUJXey87P1m+rDUtMgTzOiI0gwS3xCMTY2sxAdA1AUZ2/w4cz+gCvqEPuUNJcrItm+YEl03cOEIestjeSg9KMZ5ZVo0SkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0067
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 01:46:59PM +0200, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 11:22 PM Francesco Dolcini
> <francesco.dolcini@toradex.com> wrote:
> > On Mon, Sep 05, 2022 at 11:08:11PM +0200, Linus Walleij wrote:
> > > On Mon, Sep 5, 2022 at 3:55 AM kernel test robot <lkp@intel.com> wrote:
> > >
> > > > kismet warnings: (new ones prefixed by >>)
> > > > >> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
> > > >
> > > >    WARNING: unmet direct dependencies detected for PINCTRL_IMX
> > > >      Depends on [n]: PINCTRL [=y] && OF [=n]
> > > >      Selected by [y]:
> > > >      - PINCTRL_IMX8MM [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
> 
> It's not a regression but it's nice to have COMPILE_TEST working.
> 
> For me as a subsystem maintainer it's nice to have COMPILE_TEST
> working because otherwise the bots keep pestering me with this
> kind of stuff until it is fixed.

Sure, the patch [0] I already sent is also fixing this issue.

Francesco

[0] https://lore.kernel.org/all/20220905224408.346425-1-francesco.dolcini@toradex.com/

