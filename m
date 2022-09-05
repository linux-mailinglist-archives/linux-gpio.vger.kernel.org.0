Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4636D5AD3ED
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237743AbiIENau convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 5 Sep 2022 09:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237814AbiIENat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:30:49 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54AC1F2C0
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:30:47 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2041.outbound.protection.outlook.com [104.47.22.41]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-UtLzZmUEOu-0OtPbHT0D5Q-2; Mon, 05 Sep 2022 15:30:43 +0200
X-MC-Unique: UtLzZmUEOu-0OtPbHT0D5Q-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB0065.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:1c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 13:30:41 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b%2]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 13:30:41 +0000
Date:   Mon, 5 Sep 2022 15:30:40 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel test robot <lkp@intel.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32]
 drivers/pinctrl/freescale/pinctrl-imx.c:260:9: error: call to undeclared
 function 'pinmux_generic_get_function'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <20220905133040.GB6496@francesco-nb.int.toradex.com>
References: <202209050605.fezJUgFH-lkp@intel.com>
 <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
In-Reply-To: <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::15) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f979fecc-964a-45aa-71d0-08da8f42d3f3
X-MS-TrafficTypeDiagnostic: GV0P278MB0065:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: zfQQ6CarPWMoaBGncBYC4aj/vBOvykhoU7tv+XtvceGB8ukwxrX4OCl4JaoghceV93cIFdl9IHbOf2tDeyaUM5SgzIfajr75oag1H69f3V6Lcj+LPUmSPEjp3Swg2dsMs/Wjh8LVwVTdNRnTmnCr/7ONKbewup7f6KP/yhswVHIi0+NSYuAEquWI04fwzyCuneGRgDtfOsSEJo+yYrwzv+XNW6rJhLfHe4yI81nSAdf8da6L5cx1fnbFtb4WV3OYAK/upxa9ZAWfEhEH+lA8JaKvbLf470/xvVscsbIOGrbJGNNr5+SPeNT2T7VP6kAl/5LPQCquhBcw1DwmRm9Ei7gUh39dLMApcHjK5nSAnqWUZZbacFcs8CGcxS8c3bPdwf+vqCVpzK8SMCiP4lsMbP5G+3VQ7Y+Uw3V64EbjO8hXgOe/duJA22tazegu/lka58RDeNOLrWEAFrZE5RA3zQA18Nuk73wFpnTqdqWK5EyTLjjNAK1q9uw22DW9xuqgm9wloG1eGIuxKEqx8QsfMQb8tidIrKovze2AKvVkMYjdrBMcZbMG4zHTbLcJl7PvDWaW0+N1ebSPd+6xGC1olYE0MBecLmrYl2MUcH2okztWf3fm9hrkId551MoBHF3oDrbOOtaSAbK411S0W+uxuhBRxpPv8xYOwS4WGZvzf0qFS6tvcj0HqnMBEn6EnqD7Zfemq1HexZrj9ANFo2z1HvFFxv7Q0CkhL6newIdsgACQE3O6kLlbZuuJErBr5ywGPyDL88ram+sSAsDrTXU2LDmxKztHojSfOOLRk8rDi/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(136003)(376002)(39840400004)(6512007)(52116002)(53546011)(26005)(478600001)(6506007)(83380400001)(6486002)(41300700001)(186003)(1076003)(2906002)(4744005)(8936002)(5660300002)(316002)(6916009)(54906003)(66556008)(66476007)(66946007)(4326008)(8676002)(44832011)(86362001)(33656002)(38100700002)(38350700002)(41533002);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gsdr+p6qn9FoCGJQeU4Nv+UTQGqK8fbAo79JbvUcnmRyxHYC1av+rOFuFzqa?=
 =?us-ascii?Q?Bmbb2gFSHeQEKdMUvzh5YJpU+Vlj6loNOs4eauBNOpMxNNOjLwLEd7WVjbiZ?=
 =?us-ascii?Q?BCJkBCuPp/f4KO+CSEMBHCzzUluMeom/px88eRZDaGbKc4MFeZD9mWDray2P?=
 =?us-ascii?Q?WRLG+D1jaKdkrvdloDho+T84ujdVsEAyoXMJJlnsRz15RXdYgm00ryZkI9eI?=
 =?us-ascii?Q?jvh5uHTwkN6YF0bR5dAWsjMdCgBSataDwR/g4x8blgGHB0fAFmeU8Gi7N/8j?=
 =?us-ascii?Q?IV9A3WXbpYdkjPvKGJdbtCw/OBdirfNiRxAH4Z5iyuLfieOXIi56DBu9Mrgw?=
 =?us-ascii?Q?XjSFsxsuivm0qEgHvf0RPkd/Zyuw7mzjAMU7DM0DFhOukW0IWbalt05QUAk8?=
 =?us-ascii?Q?D34IB8sN9xWIv+RHcS+jrF5RD5AWW9wHI3r6zlb+gPXKbgs9MIKVu41aTWI1?=
 =?us-ascii?Q?cJnfn1KV2ASy0SnHnTkLo5M97SZsqX24GWnwyqXk1bjSb9oU29F6f6qSlQDA?=
 =?us-ascii?Q?zy4rCPuressZJhSiUCKjc2POOrNWwoeE8d3SZXMClC+bHrB0uBAItb90PDAO?=
 =?us-ascii?Q?tompzkPf5SKfDhiaAOQXU1auQ+UTpmC8ntJ+fbyDWzq1yg39tRatKrsD1gMJ?=
 =?us-ascii?Q?Njnhbgj7IfsW+eVVE7Hc/J6YMn7hmixskPiVtU1/Gw59jZ1rWi1iAqRjYlvU?=
 =?us-ascii?Q?XVj/252I6986UAhpRxXemKlJsxGJvoRIzMCk310NFvkk99U6kzXy4rVxwYfE?=
 =?us-ascii?Q?FOxS98IHgl1r4FPqRmhyLlgmSKtDHWp3p1IrLa0u75e9xzhawxK7K2u58uXW?=
 =?us-ascii?Q?7j7eAoQtN9XcGxISKsrq5cgvBRAcYvW8h6i1DgZHH0NISr+LFDnzwDq2G+yW?=
 =?us-ascii?Q?oBmt1YGNIDW3VEaH6+HgDhEE6voadNOaTOhBWZJqA/jFo1ueTKCtmO0ur2Tv?=
 =?us-ascii?Q?ijVRyy4zT5rvHJ+gvRyUZS32Aj4NR1Ln5CZXfUUNW3Ycpf8ebc17jcmpdwil?=
 =?us-ascii?Q?A8V7UuvzqUCB2X5uMcgNEvvtAmSc+I+6xbV1nTlVJIUcSvuM+abEiQZ/FiI+?=
 =?us-ascii?Q?mFN+4rMXqROMvf49psc2IVOKo6LkPoOTJBJdEl7xze1hEqeNs9QPKu3KzwOX?=
 =?us-ascii?Q?kAEArPi517nJ4XdAlGqOx2jg7ESiEza8sSJ97SQqVqJillfapSDrpTLjBkQX?=
 =?us-ascii?Q?weZ2/7KYGmzkjCOoBH/HfdmDd/JHeXPAfNbSESeDt7/r7+nWTA0nTOETb6hR?=
 =?us-ascii?Q?ga88EcEf5kJaI/2QPhaGznWmc093aFoZocd3L25VmzLbOJG2dCKamU/UfNoc?=
 =?us-ascii?Q?cgl3L/eTX0WbEKM0sDA27IhWxPLwgUZThGerg0jpKdBdO3WKsSMYSrhXmy/L?=
 =?us-ascii?Q?0RoXGrTXw50E75UIZRbM7lm+p0ps2lvmR/tMXNPFg4eYaLeREH5gwGUlr/CQ?=
 =?us-ascii?Q?cAN8hQhdguX00D7MPjdMJkMGOOkxhaxOp2c9pC6tCvhERkPVc9IlBH3v6Vgr?=
 =?us-ascii?Q?3wwM/IS9fdDuN3s4TTnS0cHJ2ATpLG/LC0UtQhDVIZZB4fph3y6pduWqfNTc?=
 =?us-ascii?Q?edbjBFfMFMMm/2Ovbi5a+AakvziF/edHUiY2+s8mUp1/I8rFN9cpoMV6gtyE?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f979fecc-964a-45aa-71d0-08da8f42d3f3
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:30:41.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWiRlOFTHZfbJMnmsuC53W4uOstKlEuZDmAzbdoSzVOFGNoVKSNmWxsS0mlMIccycwrl+4xVvwKTvd79lgPYORlzdi+U64ZTYbxPZOk07xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0065
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

On Mon, Sep 05, 2022 at 02:36:21PM +0200, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 12:25 AM kernel test robot <lkp@intel.com> wrote:
> > >> drivers/pinctrl/freescale/pinctrl-imx.c:288:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
> >            .get_function_name = pinmux_generic_get_function_name,
> >                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >                                 pinmux_generic_free_functions
> 
> I don't understand this at all, tried to look at it.
> 
> Francesco, do you have ideas?

Maybe the reason is that before my change the dependency was on
ARCH_MXC that cannot be compiled in test, while SOC_IMX8M dependency is
`depends on ARCH_MXC || COMPILE_TEST` leading to all of these.

The trivial fix would be to have the pinctrl dependency on SOC_IMX8M &&
ARCH_MXC. I'm not convinced is the smartest way but I think it will
work. What do you think? Should I send a patch or you have a better
idea?

Francesco

